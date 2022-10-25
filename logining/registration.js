const firsrForm = document.getElementById('first'),
    textEmail = document.getElementById('textEmail'),
    textPassword = document.getElementById('textPassword'),
    textRepeatPassword = document.getElementById('textRepeatPassword'),
    allInput = document.querySelectorAll('input[name="enter"]'),
    emailError = document.getElementById('emailError'),
    passError = document.getElementById('passError'),
    repeatPassError = document.getElementById('repeatPassError')

let arrayUser = new Array(),
    count = 0,
    users = [] 

class UserInfo  {
    constructor(login,pass){
        this.login = login;
        this.pass = pass;
    }
    toString(){
        return `${this.login};${this.pass};`
        }
}


function validtateEmail(email){
    let reg = /^((([a-zA-Z]|[._-])*))@((([a-zA-Z]+\.)+[a-zA-Z]{2,}))+$/g
    return reg.test(email)
}

function validtatePassword(pass){
    let reg = /^(?=.*[0-9)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{6,}$/g
    return reg.test(pass)
}

function getCookie(){
    let cookieString = decodeURIComponent(document.cookie);
    let cookieArray = cookieString.split("; ")
    console.log(cookieArray);
    return cookieArray
}

function getCountUsersfromCookie(){

    let cookieArray = getCookie()

    if(cookieArray.length < 0) return;
    else{
        for (let i = 0; i < cookieArray.length; i++) {

            arrayUser = cookieArray

            if(/^user/.test(cookieArray[i])){
                let userItem = cookieArray[i].split("=");
                let userValues = userItem[1].split(";");
                users.push(userValues[0])
              }
    
            if(/^count/.test(cookieArray[i])){
                let counterItem = cookieArray[i].split("=");
                let counterValue = +(counterItem[1]);
                count += counterValue;
              }
          }
    }
}


getCountUsersfromCookie()

firsrForm.onsubmit = function(){

    allInput.forEach(function (input){
        if(input.value === '' || input.value === ' '){
            input.classList.add('is-invalid')
            return false
        }else{
            input.classList.remove('is-invalid')
            input.classList.add('is-valid')
        }  
    })
    
    if(!document.querySelector('#emailError p')){
        var pEmail = document.createElement('p')
        pEmail.classList.add('text-danger','mb-0','fs-9')
        emailError.appendChild(pEmail)
    }else{
        pEmail = document.querySelector('#emailError p')
    }

    if(!document.querySelector('#passError p')){
        var pPass = document.createElement('p')
        pPass.classList.add('text-danger','mb-0','fs-9')
        passError.appendChild(pPass)
    }else{
        pPass = document.querySelector('#passError p')
    }

    if(!document.querySelector('#repeatPassError p')){
        var pReapPass = document.createElement('p')
        pReapPass.classList.add('text-danger','mb-0','fs-9')
        repeatPassError.appendChild(pReapPass)
    }else{
        pReapPass = document.querySelector('#repeatPassError p')
    }


    if (!validtateEmail(textEmail.value)){
        textEmail.classList.add('is-invalid')
        emailError.classList.remove('display-none')

        pEmail.innerText = 'Email it\'s not correct'
        console.log('Email not valid')
        // return false
    }else{
        emailError.classList.add('display-none')
    }

    if (!validtatePassword(textPassword.value)){
        textPassword.classList.add('is-invalid')
        passError.classList.remove('display-none')

        pPass.innerText = 'Password it\'s not correct'
        console.log('Password not valid')
        // return false
    }else{
        passError.classList.add('display-none')
    }

    if (!validtatePassword(textRepeatPassword.value)){
        textRepeatPassword.classList.add('is-invalid')
        repeatPassError.classList.remove('display-none')

        pReapPass.innerText = 'Password it\'s not correct'
        console.log('RepeatPassword not valid')
        return false
    }else{
        repeatPassError.classList.add('display-none')
    }

    if(textPassword.value != textRepeatPassword.value && textPassword.value == '' && textRepeatPassword.value == ''){
        return false
    }else{
        console.log(`Write to cookie: ${textEmail.value,textPassword.value,textRepeatPassword.value}`);

        if (users.includes(textEmail.value)){
            console.log('он есть в списке');
            console.log(`его номер: ${arrayUser.find(e => e.includes(textEmail.value)).split('=')[0]}`);
            document.cookie = `loggedIn=${arrayUser.find(e => e.includes(textEmail.value)).split('=')[0]};max-age=3600; path=/`
            
        }else{
            count++
            document.cookie = `${"user" + count}=${encodeURIComponent(new UserInfo(textEmail.value,textPassword.value).toString())};max-age=3600; path=/`
           document.cookie = `count=${count}; max-age=3600; path=/`;
           document.cookie = `loggedIn=${"user" + count};max-age=3600; path=/`
           
        }
       
    }

}


