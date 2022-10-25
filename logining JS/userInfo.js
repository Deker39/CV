const secondForm = document.getElementById('secondForm'),
    linkExit = document.getElementById('exit'),
    inputFirstName = document.getElementById('inputFirstName'),
    inputLastName = document.getElementById('inputLastName'),
    inputBirthday = document.getElementById('inputBirthday'),
    selectGender = document.getElementById('selectGender'),
    inputPhoneNumber = document.getElementById('inputPhoneNumber'),
    inputSkype = document.getElementById('inputSkype'),
    greetings = document.getElementById('greetings')

let arrayUser = new Array(),
    us,
    users = [],
    count

class UserInfoMore{
    constructor(firstName,lastName,birthday,gender,phoneNumber,skype){
        this.login = arrayUser.find(e => e.includes(us)).split('=')[1].split(';')[0];
        this.pass = arrayUser.find(e => e.includes(us)).split('=')[1].split(';')[1];
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthday = birthday;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.skype = skype;
    }
    toString(){
        return `${this.login};${this.pass};${this.firstName};${this.lastName};${this.birthday};${this.gender};${this.phoneNumber};${this.skype};`
        }
    
}

function getCookie(){
    let cookieString = decodeURIComponent(document.cookie);
    let cookieArray = cookieString.split("; ")
    console.log(cookieArray);
    return cookieArray
}

function deleteCookie() {
    count--
    document.cookie = `${us}='';max-age=-1; path=/`
    document.cookie = `count=${count};max-age=3600; path=/`
    document.cookie = `loggedIn='';max-age=-1; path=/`
  }

function getUsersfromCookie(){

    let cookieArray = getCookie()

    arrayUser = cookieArray

    if(cookieArray.length < 0) return;
    else {
        for (let i = 0; i < cookieArray.length; i++) {

            if (/^loggedIn/.test(cookieArray[i])) {
                us = cookieArray[i].split("=")[1]
            }   
            if (/^count/.test(cookieArray[i])) {
                count = cookieArray[i].split("=")[1]
            }           
            
        }

        users = arrayUser.find(e => e.includes(`${us}=`)).split("=")[1].split(";")
    }
  }

function writeInfo(){
    
    inputFirstName.value = users[2]
    inputLastName.value = users[3]
    inputBirthday.value = users[4]
    selectGender.value = users[5]
    inputPhoneNumber.value = users[6]
    inputSkype.value = users[7]
}

getUsersfromCookie()
users.length > 3? writeInfo() : false

greetings.classList.remove('display-none')
greetings.prepend(`Hello,  ${arrayUser.find(e => e.includes(`${us}=`)).split('=')[1].split(';')[0]} `)



secondForm.onsubmit = function(){

    console.log(inputFirstName.value, inputLastName.value, inputBirthday.value, selectGender.value,
        inputPhoneNumber.value, inputSkype.value);
        if (inputFirstName.value == '' && inputLastName.value == '' && inputBirthday.value == '' && selectGender.value == '' &&
        inputPhoneNumber.value == '' && inputSkype.value == ''){}
        else{
            document.cookie = `${us}=${encodeURIComponent(new UserInfoMore(inputFirstName.value, inputLastName.value, inputBirthday.value, selectGender.value,
                inputPhoneNumber.value, inputSkype.value).toString())};max-age=3600; path=/`
        } 
       
}