//校外客户信息列表

//设置全局表单提交样式
Vue.http.options.emulateJSON = true;

//创建Vue实例
var vm = new Vue({
    el: '#app',
    data() {
        return {
            //element-ui的table需要的参数必须是Array类型的
            goods: [{
                id: '',
                title: '',
                price: '',
                image: '',
                brand: ''
            }],

            //编辑表
            editor: {
                title: '',
                price: '',
                image: '',
                brand: ''
            },
            //添加dialog
            showSave: false,
            //编辑dialog
            showEditor: false,

            //条件查询单独封装的对象
            searchEntity: {},

            //checkbox选择的行中所有数据，将会放入multipleSelection中
            multipleSelection: [],
            //被checkbox选择id值，用于批量删除
            selectIds: [],
            //tag栏目，此栏表示checkbox选择了几行
            count: 0,

            //分页选项
            pageConf: {
                //设置一些初始值
                pageCode: 1,//当前页
                pageSize: 6,//每页显示的记录数
                totalPage: 12,//总记录数
                pageOption: [6, 10, 20] //分页数量选择
            },
            loading: {},

            //文件上传参数
            dialogImageUrl: '',
            dialogVisible: false,
            //图片列表
            fileList: [{name: '', url: ''}],

            activeIndex: '2'//默认激活
        }

    },
    methods: {
        /**
         * loading加载动画
         */
        loadings() {
            this.loading = this.$loading({
                lock: true,
                text: '拼命加载中',
                spinner: 'el-icon-loading'
            });
            setTimeout(() => {
                this.loading.close();
            }, 2000);
        },
        /**
         * Public Methods
         */
        reloadList() {
            this.search(this.pageConf.pageCode, this.pageConf.pageSize);
        },
        //条件查询
        //条件查询
        search(pageCode, pageSize) {
            this.loadings();
            this.$http.post('/goods/findByPage?pageSize=' + pageSize + '&pageCode=' + pageCode, this.searchEntity).then(result => {
                console.log(result);
                this.goods = result.body.rows;
                this.pageConf.totalPage = result.body.total;
                this.loading.close(); //数据更新成功就手动关闭动画
            });

        },
        //checkbox复选框
        selectChange(val) {
            this.count = val.length;
            this.multipleSelection = val;
        },
        //清空已经选择
        clearSelect(){
            this.$refs.goods.clearSelection();
        },
        //pageSize改变时触发的函数
        handleSizeChange(val){
            this.search(this.pageConf.pageCode,val)
        },
        handleCurrentChange(val){
            this.pageConf.pageCode = val;//为了保证刷新列表后页面还是在当前页，而不是跳转到下一页
            this.search(val,this.pageConf.pageSize);
        },
        //更新
        sureEdit(editor){
            //关闭对话框
            this.showEditor =false;
            //调用更新数据的接口
            this.$http.post('/goods/update',JSON.stringify(this.editor)).then(result =>{
               if (result.body.success){
                   //更新成功
                   this.$message({
                       type:'success',
                       message:result.body.message,
                       duration:6000
                   });
                   //刷新列表

                   this.reloadList();
                   this.goods=[];
                   this.$refs.editor.resetFields();
               }  else {
                   //更新失败
                   this.$message({
                      type:'warning',
                      message:result.body.message,
                      duration:6000
                   });
                   //刷新列表
                   this.reloadList();
                   this.$refs.editor.resetFields();
               }
            });
        },
        //删除
        sureDelete(ids){
            this.$confirm('你确定永久删除此用户信息吗？','提示',{
                confirmButtonText:'确定',
                cancelButtonText:'取消',
                type:'warning',
                center:true
            }).then(()=>{
                //调用删除的接口(这里必须使用JSON数据格式，不然接收不到信息，且后端要用@RequestBody注解)
                this.$http.post('/goods/delete',JSON.stringify(ids)).then(result=>{
                        if (result.body.success){
                            //删除成功
                            this.selectIds=[];//清空选项
                            this.$message({
                                type:'success',
                                message:result.body.message,
                                duration:6000
                            });
                            //刷新列表
                            if ((this.pageConf.totalPage-1) / this.pageConf.pageSize === (this.pageConf.pageCode-1)){
                                this.pageConf.pageCode = this.pageConf.pageCode- 1;
                            }
                            this.reloadList();
                        }else{
                            //删除失败
                            this.selectIds = [];
                            this.$message({
                                type:'warning',
                                message:result.body.message,
                                duration:6000
                            });
                            //刷新列表
                            this.reloadList();
                        }
                    });

            }).catch(()=>{
                this.$message({
                    type:'info',
                    message:'已取消删除',
                    duration:6000
                })
            })
        },

        //添加
        save(editor) {
            this.$refs[editor].validate((valid) => {
                if (valid) {
                    //关闭dialog
                    this.showSave = false;
                    //调用保存的接口
                    this.$http.post('/goods/create', JSON.stringify(this.editor)).then(result => {
                        if (result.body.success) {
                            //保存成功
                            this.$message({
                                type: 'success',
                                message: result.body.message,
                                duration: 6000
                            });
                            //刷新表格
                            this.reloadList();
                            this.editor = {};
                            this.$refs.editor.resetFields();
                        } else {
                            //保存失败
                            this.$emit(
                                'save',
                                this.$message({
                                    type: 'warning',
                                    message: result.body.message,
                                    duration: 6000
                                }),
                            );
                            //刷新表格
                            this.reloadList();
                            this.editor = {};
                            this.$refs.editor.resetFields();
                        }
                    });
                } else {
                    this.$emit(
                        'save',
                        this.$message({
                            message: '输入信息有误！',
                            type: 'warning',
                            duration: 6000
                        }),
                    );
                    return false;
                }
            });
        },

        /**
         * private methods
         */
        saveBtn(){
            //打开新增dialog
            this.showSave = true;
            this.editor = {};//清空表单
            this.fileList=[]; //清空温家安列表

            //清空原始数据
            if (this.$refs['editor']!== undefined){
                this.$refs['editor'].resetFields();//经查询；可能是由于对象还没有生成，导致了误读了独享报错
            }
        },
        //更新按钮(表格)
        handleEdit(id){
            //打开dialog
            this.showEditor =true;
            this.editor={};//清空表单
            //查询当前的id对应的数据
            this.$http.post('/goods/findById',{id:id}).then(result=>{
                this.fileList.forEach(row=>{
                    row.url = result.body[0].image;//将图片的URL地址赋值给fileList展示出来
                });
                this.editor =result.body[0];
                //移除element-ui表单校验残留
                this.$refs['editor'].resetFields();
            });

        },
        //更新按钮
        editSelect(){
          if (this.multipleSelection.length===1){
              this.multipleSelection.forEach(row=>{
                  this.editor={} ;//清空数据
                  this.editor = row;//再赋值
                  this.fileList.forEach(file=>{
                      file.url=row.image;//将图片的URl地址赋值给file-list展示出来
                  });
                  //移除element-ui表单校验残留
                  this.$refs['editor'].resetFields();
                  this.showEditor = true;//打开对话框
              });
          }else if(this.multipleSelection.length>1){
              //只能选择一个进行编辑
              this.$message({
                  type:'info',
                  message:'请选择至少一个进行编辑',
                  duration:6000
              });
          }else{
              this.$message({
                  type:'info',
                  message:'请选择至少一个进行编辑',
                  duration:6000
              })
          }
        },
        //删除按钮
        handleDelete(id){
            var ids = new Array();
            ids.push(id);
            this.sureDelete(ids);
        },
        //批量删除按钮
        deleteSelect(rows){
            if (rows){
                rows.forEach(row=>{
                    this.selectIds.push(row.id);
                    this.$refs.goods.toggleRowSelection(row);
                });
                //调用删除方法
                this.sureDelete(this.selectIds);
            }else {
                this.$refs.goods.clearSelection();
            }
        },
        /**
         * 图片上传
         */
        handleSuccess(res,file,fileList){
            this.$message({
                type:'info',
                message:'图片上传成功',
                duration:6000
            });
            if (file.response.success){
                this.editor.image = file.response.message;//将返回的文件储存路径赋值给image字段

            }
        },
        //删除文件之前的钩子函数
        handleRemove(file,fileList){
            this.$message({
                type:'info',
                message:'已删除原有图片',
                duration:6000
            });
        },
        //点击列表中已上传的文件的钩子函数
        handlePreview(file){

        },
        //上传的文件个数，超出设计时触发的函数
        onExceed(files,fileList){
            this.$message({
                type:'info',
                message:'最多上传一张图片',
                duration:6000
            });
        },
        //文件上传的钩子函数
        //参数是上传的文件，若返回false，或返回Primary且被拒绝，则停止上传
        beforeUpload(file){
            const isJPG = file.type==='image/jpeg';
            const isGIF = file.type==='image/gif';
            const isPNG = file.type==='image/png';
            const isBMP = file.type==='image/bmp';
            const isLt2M = file.size / 1024 /1024 < 2;

            if(!isJPG && !isPNG && !isGIF && !isBMP){
                this.$message.error('上传图片必须是JPG/PNG/GIF/BMP 格式！')
            }
            if (!isLt2M){
                this.$message.error('上传图片大小不能超过2MB!')
            }
            return (isJPG || isBMP || isGIF || isPNG ) && isLt2M;
        }
    },
    //生命周期函数
    created() {
        this.search(this.pageConf.pageCode, this.pageConf.pageSize);
        this.loadings();//加载动画
    }

});