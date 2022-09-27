let form = document.querySelector('#form'),
    inputTitle  = document.querySelector('#titleId'), 
    inputType  = document.querySelector('#typeId'),
    typeError = document.querySelector('#typeError'),
    titleError = document.querySelector('#titleError'),
    formInputs = document.querySelectorAll(".form-control"),
    emptyInputs = Array.from(formInputs).filter(input => input.value === ''),
    sectFirst = document.querySelector('#section-first'),
    btnSearch = document.querySelector('#search'),
    token = '55f2a631',
    sectMovieList = document.createElement('section'),
    navPag = document.querySelector('#pag'),
    sec_pag = document.querySelector('#sec_pag'),
    sectMovieInfo= document.createElement('section')

function creatDetailMovie(img,title,relesed,gener,country,director,writer,actors,awards){
    // let sectMovieInfo= document.createElement('section'),
    let contInfo = document.createElement('div'),
        contImgInfo = document.createElement('div'),
        contTextInfo = document.createElement('div'),
        textTitle = document.createElement('p'),
        textRelesed = document.createElement('p'),
        textGener = document.createElement('p'),
        textCountry = document.createElement('p'),
        textDirectors = document.createElement('p'),
        textWriter = document.createElement('p'),
        textActors = document.createElement('p'),
        textAwards = document.createElement('p')
    

    if (!document.querySelector('#secFilmInfo h2')) {
        let textInfo = document.createElement('h2')
        textInfo.innerHTML = 'Films info'
        textInfo.classList.add('d-flex', 'justify-content-center', 'align-content-center')
        sectMovieInfo.appendChild(textInfo)
    } else {
        textInfo = document.querySelector('section h2')
    }  


    sectMovieInfo.classList.add('container', 'mb-5', 'd-flex','flex-column','align-content-center')
    sectMovieInfo.setAttribute('id','secFilmInfo')

    document.body.appendChild(sectMovieInfo) 
    sectMovieInfo.appendChild(contInfo)
    contInfo.appendChild(contImgInfo)
    contInfo.appendChild(contTextInfo)
    contTextInfo.appendChild(textTitle)
    contTextInfo.appendChild(textRelesed)
    contTextInfo.appendChild(textGener)
    contTextInfo.appendChild(textCountry)
    contTextInfo.appendChild(textDirectors)
    contTextInfo.appendChild(textWriter)
    contTextInfo.appendChild(textActors)
    contTextInfo.appendChild(textAwards)

    contInfo.classList.add('d-flex', 'flex-row',  'mb-3', 'border', 'ms-3', 'bg-light')
    contImgInfo.classList.add('m-2')
    contTextInfo.classList.add('m-2')
    textTitle.classList.add('fs-4')
    textRelesed.classList.add('fs-4')
    textGener.classList.add('fs-4')
    textCountry.classList.add('fs-4')
    textDirectors.classList.add('fs-4')
    textWriter.classList.add('fs-4')
    textTitle.classList.add('fs-4')
    textActors.classList.add('fs-4')

    contInfo.style.minWidth = "800px"
    contInfo.style.height = "450px"
    contImgInfo.style.minWidth  = "300px"
    contImgInfo.style.minHeight = "400px"
    if(img == 'N/A'){
        contImgInfo.style.background = `url(no_film.png) center/cover no-repeat`
        
    }else{
        contImgInfo.style.background = `url(${img}) center/cover no-repeat`
    }

    textTitle.innerText = `Title: \t${title}`
    textRelesed.innerText = `Relesed: \t${relesed}`
    textGener.innerText = `Gener: \t${gener}`
    textCountry.innerText = `Country: \t${country}`
    textDirectors.innerText = `Directors: \t${director}`
    textWriter.innerText = `Writer: \t${writer}`
    textTitle.innerText = `Actors: \t${actors}`
    textActors.innerText = `Awards: \t${awards}`
    

}

function creatListMovies(img,name,type,year) {
    
    var contMovieItem = document.createElement('div'),
        contImg = document.createElement('div'),
        contTextItem = document.createElement('div'),
        textType = document.createElement('p'),
        textName = document.createElement('p'),
        textYear = document.createElement('p'),
        btnDetails = document.createElement('button')

    sectMovieList.classList.add('container', 'mb-5', 'd-flex','justify-content-center')
    document.body.insertBefore(sectMovieList,sec_pag)
    

    if (!document.querySelector('#form + h2')) {
        let textList = document.createElement('h2')
        textList.innerHTML = 'Films'
        textList.classList.add('d-flex', 'justify-content-center', 'align-content-center')
        sectFirst.appendChild(textList)
    } else {
        textList = document.querySelector('#form + h2')
    }
  

    sectMovieList.appendChild(contMovieItem)
    contMovieItem.appendChild(contImg)
    contMovieItem.appendChild(contTextItem)
    contTextItem.appendChild(textType)
    contTextItem.appendChild(textName)
    contTextItem.appendChild(textYear)
    contTextItem.appendChild(btnDetails)

    contMovieItem.setAttribute('id','num')
    contMovieItem.classList.add('d-flex', 'flex-row',  'mb-3', 'border', 'ms-3', 'bg-light')
    contImg.classList.add('m-2')
    contTextItem.classList.add('m-2', 'position-relative')
    textName.classList.add('fw-bold')
    btnDetails.classList.add('btn', 'btn-firts', 'btn-primary', 'position-absolute', 'bottom-0', 'end-0')
    
    contMovieItem.style.minWidth = "320px"
    contMovieItem.style.maxWidth = "350px"
    contMovieItem.style.height = "270px"
    contImg.style.minWidth  = "150px"
    contImg.style.height = "250px"
    if(img == 'N/A'){
        contImg.style.background = `url(no_film.png) center/cover no-repeat`
        
    }else{
        contImg.style.background = `url(${img}) center/cover no-repeat`
    }
    
    textType.innerText = `Type: ${type}`
    textName.innerText = `Title: ${name}`
    textYear.innerText = `Year made: ${year}`
    btnDetails.textContent = 'Details'

    btnDetails.addEventListener('click', function(e){
        detailRequest(name)// add url
    });
    
}

function detailRequest(name){
    let request
    url_item = `https://www.omdbapi.com/?t=${name.replace(/ /g,'+')}&apikey=${token}`
    console.log(url_item);
    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    }
    else {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }
    request.open('GET', url_item)
    request.responseType = "json";
    request.onload = function () {
        if (request.readyState === 4 &&request.status == 200) {
            let person = request.response;
            sectMovieInfo.innerHTML = ""
            console.log(person);
            creatDetailMovie(person['Poster'],person['Title'],person['Released'],person['Genre'],person['Country'],
                person['Director'],person['Writer'],person['Actors'],person['Awards'])
        }
    }
    request.send();
    return false
}




form.onsubmit = function(){
    let titleValue = inputTitle.value.toLowerCase(),
        typeValue = inputType.value.toLowerCase(),
        request


    formInputs.forEach(function (input){
        if(input.value === '' || input.value === ' '){
            input.classList.add('is-invalid')
        }else{
            input.classList.remove('is-invalid')

        }
        
    });

    if(!document.querySelector('#titleError p')){
        var pTittle = document.createElement('p')
        pTittle.classList.add('text-danger','mb-0','fs-9')
        titleError.appendChild(pTittle)
    }else{
        pTittle = document.querySelector('#titleError p')
    }

    if(!document.querySelector('#typeError p')){
        var pType = document.createElement('p')
        pType.classList.add('text-danger','mb-0','fs-9')
        typeError.appendChild(pType)
    }else{
        pType = document.querySelector('#typeError p')
    }

    if (typeValue == "") {

        pType.innerText = 'Need to select the type'

        typeError.classList.remove('display-none')
        inputType.classList.add('is-invalid')
        console.log('Type not valid')
        return false
    }else{
        typeError.classList.add('display-none')
        inputType.classList.add('is-valid')
    }


    url_list = `https://www.omdbapi.com/?s=${titleValue.replace(/ /g,'+')}&type=${typeValue}&apikey=${token}`
    // console.log(url);
    
    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    }
    else {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }
    request.open('GET', url_list)
    request.responseType = "json";
    request.onload = function () {
        if (request.readyState === 4 &&request.status == 200) {
            let person = request.response;
            console.log(person);
            if(person['Response'] == 'False'){
                pTittle.innerText = 'Movie not found!'
                titleError.classList.remove('display-none')
                inputTitle.classList.add('is-invalid')
                console.log('No such movie')
                return false
            }else{
                titleError.classList.add('display-none')
                inputTitle.classList.add('is-valid')
                generPagination(person)
               
            }
            
            
        }
    }
    
    request.send();


    if(emptyInputs.length == 0){
        console.log('input not filled');
        return false
    }

    return false
}



function generPagination(person){
    var amount = 3; //сколько отображаем сначала
    var amount_page = Math.ceil(person['Search']['length'] / amount); //кол-во страниц
    
    //выводим список страниц
    var paginator = document.querySelector(".paginator"),
        tag_start = "<li class=\"page-item\"><a class=\"page-link\" href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>",
        tag_end = "<li class=\"page-item\"><a class=\"page-link\" href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&raquo;</span></a></li>",
        tag = tag_start
    
    for (var i = 0; i < amount_page; i++) {
        tag += "<li class=\"page-item\" data-page=" + i * amount + "  id=\"page" + (i + 1) + "\"><a class=\"page-link\" href=\"#\">" + (i + 1) + "</li>";
    }

    tag += tag_end
    paginator.innerHTML = tag

    let items = document.querySelectorAll('.paginator li'),
        notes = person['Search'].slice(0, amount)
     
  


    for (let item of items) {
        item.addEventListener('click', function () {
           
            let pageNum = +this.textContent,
                start = (pageNum - 1) * amount,
                end = start + amount
            notes = person['Search'].slice(start, end)

            console.log(notes,start,end);

            sectMovieList.innerHTML = ""

            for(let note of notes){
                creatListMovies(note['Poster'],note['Title'],
                                note['Type'],note['Year'])//creatListMovies(img,name,type,year)
            }
            
        });
    }
    
    for(let note of notes){
        creatListMovies(note['Poster'],note['Title'],
                        note['Type'],note['Year'])//creatListMovies(img,name,type,year)
    }
}

