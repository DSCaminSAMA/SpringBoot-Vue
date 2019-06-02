//设置全局表单提交格式
Vue.http.options.emulateJSON = true;

//实例化vue
new Vue({
   el:'#app',
   data(){
      return{
          checked:false,
          login:{
              username:'',
              password:'',
              remember:''
          },
          flag:true,
          loading:{},   //login动画
      }
   } ,
    methods:{
       //loading加载动画
        loadings(){
            this.loading = this.$loading({
                locked:true,
                text:'拼命加载中',
                spinner:'el-icon-loading',
            });
            setTimeout(() =>{
                this.loading.close();
            },2000)
        },
        submitForm(login){
            this.$refs[login].validate((valid) => {
                if (valid){
                    this.loadings();//加载动画
                    //提交表单
                    this.$http.post('/login',{
                        username: this.login.username,
                        password: this.login.password,
                    }).then(result=>{
                        //判断用户是否是否登录成功，后端返回JSON格式数据，不然取不到数据
                        if (result.body.success){
                            window.location.href = "/index";
                            this.loading.close();   //关闭动画加载
                        } else {
                            //弹出错误信息框
                            this.$emit('submit-form',
                                this.$message({
                                    message:'用户名或密码错误',
                                    type:'warning',
                                    duration:6000
                                })
                            );
                            this.$refs[login].resetField();
                        }
                    });
                } else {
                    this.$emit('submit-form',
                        this.$message({
                            message:'输入信息有误',
                            type:'warning',
                            duration:6000
                        }),
                    );
                    return false;
                }
            })
        },
        loginEnter(login){
            this.submitForm(login);
        }
    }
});