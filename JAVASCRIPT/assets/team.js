
const RegisterData = (e)=>{
     
    e.preventDefault()
 
    const username = document.getElementById("userName").value
    const userpassword = document.getElementById("userPassword").value
    const fromdata = document.getElementById("fromdata")

    if(username === "admin" && userpassword === "12345"){

        alert('LOGIN SUCCESS')
        return


    }else{
        alert("not login")
        
    }

}
RegisterData()