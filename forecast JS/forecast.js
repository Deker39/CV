const days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];


$.ajax({
    url: 'http://api.weatherstack.com/current',
    data: {
        access_key: 'ac722eb63a8bae3c2549219872c50e7d1',
        query: 'Odesa'
    },
    dataType: 'json'
    }).done(function (data) {
    console.log(data);
    var secOneDayWeather = $('<section>',{
        'class':'container mb-3 mt-3',
        'style':'width: 500px;'  
    })
    var divOneDayWeather = $('<div>',{
        'class':'border rounded  d-flex justify-content-between grad-out'
    })
    var divContCityWeater = $('<div>',{
        'class':'d-flex justify-content-between flex-column p-3 '
    })
    var pNameCity = $('<p>',{
        'class':'fw-bold fs-1 border rounded p-2 grad-in',
        text:` ${data.location.name}, ${data.location.country}`
    })
    var divContIconTemperature = $('<div>',{
        'class':'d-flex justify-content-between border rounded p-2 grad-in'
    })
    var divContIconWeater = $('<div>')
    var divContIcon = $('<div>',{
        'class': 'border rounded',
        'style': `width:64px; height:64px;  background: url(${data.current.weather_icons})`
    })
    var pWeather = $('<p>',{
        'class':'text-center',
        'style':'width: 64px;',
        text: `${data.current.weather_descriptions}`
        
    })
    var temperature =  $('<p>',{
        'class':'fs-10',
        text: `${data.current.temperature}C°`
    })
    var divContTimeAddWeather = $('<div>',{
        'class':'m-3 border rounded p-2 grad-in ms-0'
        })
    var pTime = $('<p>',{
        class: 'fs-1 mb-4',
        text:`${data.location.localtime}`
    })
    var pWind = $('<p>',{
        text:`Wind: ${data.current.wind_speed}kph`
    })
    var pPrecip = $('<p>',{
        text:`Precip: ${data.current.precip}mm`
    })
    var pPressure = $('<p>',{
        text:`Pressure: ${data.current.pressure}mb`
    })
    var pForecast = $('<p>',{
        'class':'fs-3 mb-1 text-center',
        text:'Forecast Today now'
    })


   $('body').append(secOneDayWeather
                .append(pForecast,divOneDayWeather
                    .append(divContCityWeater
                        .append(pNameCity,divContIconTemperature
                                            .append(divContIconWeater
                                                .append(divContIcon,pWeather),temperature)),
                        divContTimeAddWeather
                            .append(pTime,pWind,pPrecip,pPressure))))

            })


// lat: "46.467"
// lon: "30.733"

$.ajax({
    url: 'https://api.openweathermap.org/data/2.5/forecast?',
    data: {
        lat: 46.467,
        lon: 30.733,
        appid: 'bf7329866498355636bce98b67774b95',
    },
    dataType: 'json'
}).done(function (data){
    console.log(data);

    var secFiveDayWeather = $('<section>',{
        'class':'container  mb-3 mt-4', 
    })
    var divFiveDayWeather = $('<div>',{
        'class':'d-flex justify-content-center flex-wrap align-items-center '
    })
    var pForecast = $('<p>',{
        'class':'fs-3 mb-1 text-center',
        text:'Forecast Five day 3 hour'
    })

    var forecast = data.list

    for(let note of forecast){

    var contDaysWeather = $('<div>',{
        'class':'d-flex flex-column align-items-center border rounded grad-in p-3 mb-3 col-3', 
    })
           
    var pTemp =  $('<p>',{
        'class':'fs-3 mb-1',
        text:` ${Math.floor(note.main.temp-273.15)}C°`
    })
    var pDayMonth=  $('<p>',{
        'class':'text-center mb-1',
        text:`${new Date(note.dt_txt).getDate()} ${months[new Date(note.dt_txt).getMonth()]}`
    })
    var pDayWeek =  $('<p>',{
        'class':'text-center mb-1',
        text:`${days[new Date(note.dt_txt).getDay()]}`
    })
    var pTime =  $('<p>',{
        'class':'text-center mb-1',
        text:`${new Date(note.dt_txt).getHours()}:00`
    })
    var divContIcon = $('<div>',{
        'class': 'border rounded',
        'style': `width:100px; height:100px;  background: url( http://openweathermap.org/img/wn/${note.weather[0].icon}@2x.png) no-repeat; background-color: white`
    })
    var pDescription = $('<p>',{
        'class':'mb-1',
        text:`${note.weather[0].description}`
    })
  

    $('body').append(secFiveDayWeather
                .append(pForecast,divFiveDayWeather
                    .append(contDaysWeather
                        .append(pDayMonth,pDayWeek,pTime,divContIcon,pDescription,pTemp))))
    }
        
 
})

