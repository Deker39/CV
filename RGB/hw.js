let form = document.querySelector('#form'),
    formInputs = document.querySelectorAll(".form-control"),
    inputColorName  = document.querySelector('#colorId'), 
    inputColorType  = document.querySelector('#typeId'), 
    inputColorCode  = document.querySelector('#codeId'),
    emptyInputs = Array.from(formInputs).filter(input => input.value === ''),
    colorError  = document.querySelector('#colorError'),
    typeError = document.querySelector('#typeError'),
    codeError = document.querySelector('#codeError'),
    divViewColor = document.querySelector('#view')

let arrayName = new Array(),
    cookieDuration = 3*60*60*1000,
    userColors = [],
    counter = 0

class ColorObject  {
    constructor(name,type,code,back_value){
        this.name = name;
        this.type = type;
        this.code = code
        this.back_value = back_value
    }
    toString(){
        return `${this.name};${this.type};${this.code};${this.back_value}`
        }
    
}
    
function validtateColorName(name){
    let reg = /^[a-zA-Zа-яА-ЯёЁ]+$/g
    return reg.test(name)
}

function validtateRGB(code){
    let reg = /^\d{1,3}[\s,]\d{1,3}[\s,]\d{1,3}$/
    return reg.test(code)
}

function validtateRGBA(code){
    let reg =  /^\d{1,3}[\s,]\d{1,3}[\s,]\d{1,3}[\s,](0.[0-9]+|[0-1])$/
    return reg.test(code)
}

function validtateHEX(code){
    let reg = /#[0-9A-Fa-f]{6}/
    return reg.test(code)
}

function creatContainer(name,type,code,back) {
    
    var divItemColor = document.createElement('div'),
        infoDivItem = document.createElement('div'),
        pInfoName = document.createElement('p'),
        pInfoType = document.createElement('p'),
        pInfoCode = document.createElement('p')

    divViewColor.appendChild(divItemColor)
    divItemColor.appendChild(infoDivItem)
    infoDivItem.appendChild(pInfoName,pInfoType,pInfoCode)

    divItemColor.classList.add('m-3','cont-color',"d-flex", "justify-content-center","align-items-center")
    infoDivItem.classList.add("d-flex", "flex-column" ,"justify-content-center","align-items-center","cont-into-color")
    pInfoName.classList.add("fs-4", "fw-bold")
    pInfoCode.classList.add("fs-4")

    divItemColor.style.backgroundColor = back //backValue  
    infoDivItem.style.backgroundColor = 'rgba(225, 225, 225, 0.25)'

    pInfoName.innerHTML = name.toUpperCase() //colorTypeValue
    pInfoType.innerHTML = type.toUpperCase() //colorTypeValue
    pInfoCode.innerHTML = `(${code})` //colorCodeValue

    infoDivItem.appendChild(pInfoName)
    infoDivItem.appendChild(pInfoType)
    infoDivItem.appendChild(pInfoCode)
}

function getColorsfromCookie(){

    let cookieString = decodeURIComponent(document.cookie);
    let cookieArray = cookieString.split("; ")
    console.log(cookieArray);

    if(cookieArray.length < 0) return;
    else{
        for (let i = 0; i < cookieArray.length; i++) {
    
            if(/^color/.test(cookieArray[i])){
              let colorItem = cookieArray[i].split("=");
              console.log(colorItem);
              let colorValues = colorItem[1].split(";");
              
              userColors.push(new ColorObject(colorValues[0], colorValues[1], colorValues[2],colorValues[3]),)
              arrayName.push(colorValues[0])
            }
            if(/^counter/.test(cookieArray[i])){
                let counterItem = cookieArray[i].split("=");
                let counterValue = +(counterItem[1]);
                counter += counterValue;
              }
          }
    }
  }



getColorsfromCookie()
console.log(userColors);
if(userColors.length > 0){
    userColors.forEach(item =>{
        creatContainer(item.name,item.type,item.code,item.back_value)
    })
    
}

  
form.onsubmit  = function(){
    let colorNameValue = inputColorName.value.toLowerCase(),
        colorTypeValue = inputColorType.value.toLowerCase(),
        colorCodeValue = inputColorCode.value.toLowerCase(),
        backValue = new String()

       
    formInputs.forEach(function (input){
        if(input.value === '' || input.value === ' '){
            input.classList.add('is-invalid')
        }else{
            input.classList.remove('is-invalid')

        }
        
    });


    if(!document.querySelector('#colorError p')){
        var pName = document.createElement('p')
        pName.classList.add('text-danger','mb-0','fs-9')
        colorError.appendChild(pName)
    }else{
        pName = document.querySelector('#colorError p')
    }

    if(!document.querySelector('#typeError p')){
        var pType = document.createElement('p')
        pType.classList.add('text-danger','mb-0','fs-9')
        typeError.appendChild(pType)
    }else{
        pType = document.querySelector('#typeError p')
    }
  
    if(!document.querySelector('#codeError p')){
        var pCode = document.createElement('p')
        pCode.classList.add('text-danger','mb-0','fs-9')
        codeError.appendChild(pCode)
    }else{
        pCode = document.querySelector('#codeError p')
    }

       

    if (!validtateColorName(colorNameValue)){
        inputColorName.classList.add('is-invalid')
        colorError.classList.remove('display-none')

        pName.innerText = 'Color can only contain letters'
        console.log('Name not valid')
        // return false
    }else{
        if(arrayName.includes(colorNameValue)){
            inputColorName.classList.add('is-invalid')
            colorError.classList.remove('display-none')
            pName.innerText = 'This name is already in use'
            console.log('Name is already in use')
            return false
        }else{
            colorError.classList.add('display-none')
            inputColorName.classList.remove('is-invalid') 
            inputColorName.classList.add('is-valid') 
        }
       
       
    } 
   
    
    if (colorTypeValue == "") {

        pType.innerText = 'Need to select the type'
        pCode.innerText = "Type not selected"

        codeError.classList.remove('display-none')
        typeError.classList.remove('display-none')
        inputColorType.classList.add('is-invalid')
        console.log('Type not valid')
        return false
    } else {

        typeError.classList.add('display-none')
        codeError.classList.add('display-none')
        inputColorType.classList.add('is-valid')

        if (colorTypeValue == 'rgb') {
            if (!validtateRGB(colorCodeValue)) {
                pCode.innerText = 'RGB code must match the pattern [0-255],[0-255],[0-255]'

                codeError.classList.remove('display-none')
                inputColorCode.classList.add('is-invalid')
                console.log('Code RGB not valid')
                return false
            } else {
                codeError.classList.add('display-none')
                inputColorCode.classList.remove('is-invalid')
                inputColorCode.classList.add('is-valid')
                backValue = `${colorTypeValue}(${colorCodeValue})`
            }

        }
        if (colorTypeValue == 'rgba') {
            if (!validtateRGBA(colorCodeValue)) {
                pCode.innerText = 'RGBA code must match the pattern [0-255],[0-255],[0-255],[0-1]'

                codeError.classList.remove('display-none')
                inputColorCode.classList.add('is-invalid')
                console.log('Code RGBA not valid')
                return false
            } else {
                codeError.classList.add('display-none')
                inputColorCode.classList.remove('is-invalid')
                inputColorCode.classList.add('is-valid')
                backValue = `${colorTypeValue}(${colorCodeValue})`
            }
        }
        if (colorTypeValue == 'hex') {
            if (!validtateHEX(colorCodeValue)) {
                pCode.innerText = 'HEX code must match the pattern #[0-F],[0-F],[0-F],[0-F],[0-F],[0-F]'

                codeError.classList.remove('display-none')
                inputColorCode.classList.add('is-invalid')
                console.log('Code HEX not valid')
                return false
            } else {
                codeError.classList.add('display-none')
                inputColorCode.classList.remove('is-invalid')
                inputColorCode.classList.add('is-valid')
                backValue = `${colorCodeValue}`
            }
        }

        
    }

    if(validtateColorName(colorNameValue) && colorTypeValue != "" && 
    (validtateRGB(colorCodeValue)||validtateRGBA(colorCodeValue)||validtateHEX(colorCodeValue))){

        creatContainer(colorNameValue,colorTypeValue,colorCodeValue,backValue)
        arrayName.push(colorNameValue)
        console.log(arrayName);

        let newcolor = new ColorObject(colorNameValue,colorTypeValue,colorCodeValue,backValue)
        userColors.push(newcolor)

        let now = +(new Date());
        let expires = new Date(now + cookieDuration);
        
        let colorkey = "color" + counter;
        counter++

        document.cookie = `${colorkey}=${encodeURIComponent(newcolor.toString())}; expires=${expires.toGMTString()}; path=/`;
        document.cookie = `counter=${counter}; expires=${expires.toGMTString()}; path=/`;

    }

    if(emptyInputs.length == 0){
        console.log('input not filled');
        return false
    }

    return false
}