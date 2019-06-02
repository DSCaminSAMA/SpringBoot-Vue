//Vue实现
new Vue({
  el:'#app',
  data(){
      return{
          name:'',

          activeIndex:'1'
      }
  } ,
    methods:{
      getName(){
          this.name = sessionStorage.getItem("name");
      }
    },
    create(){
      this.getName();   //获取用户名登录名
    }
});