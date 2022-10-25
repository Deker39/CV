class User{
    constructor(id,name,username,phone,email,company,address,website){
        this.id = id,
        this.name = name,
        this.username = username,
        this.phone = phone,
        this.email = email,
        this.company = company,
        this.address = address,
        this.website = website
    }
}

let listUsers = new Array(),
    postUser = new Array(),
    selectedUser

async function loadFetchPosts() {
    const res = await fetch("https://jsonplaceholder.typicode.com/posts");
    const body = await res.json();
    if (body) {
        postUser = body.filter(function(e){
            return e.userId == selectedUser + 1
        })
     }
    console.log(postUser);
    $('body').append(
        $(`
        <section class="container d-flex align-items-center justify-content-center  flex-column" id='listPosts'>
            <h5>User's posts:</h5>
            <div class="d-flex flex-wrap justify-content-center" id='posts'>          
            </div>
        </section>
        `)
    )
    postUser.forEach((e) =>{
        $('#posts').append(
            $(
            `<div class="border p-2 m-3" style="width: 300px;">
                    <h5>${e.title}</h5>
                    <p>${e.body}</p>
            </div>`
            )
        )
    }
    )
}

async function loadFetch() {
    const res = await fetch("https://jsonplaceholder.typicode.com/users");
    const body = await res.json();
    if (body) {
        listUsers = body.map(
        (i) =>
          new User(
            i.id,
            i.name,
            i.username,
            i.phone,
            i.email,
            i.company,
            i.address,
            i.website
          )
      );

      listUsers.forEach((e) => {
        $("#contCard").append(
          $(`<div class="border col-3 p-3 pe-4 m-3" id="user${e.id}"><h5>${e.name}</h5></div>`)
        );
      });
    }
  }

loadFetch()

$("#contCard").on('click','div', function(){
    console.log(($( this ).attr('id')).replace('user',''));
    selectedUser = ($( this ).attr('id')).replace('user','')-1
    console.log(listUsers[selectedUser].name);
    if($('#tableUserInfo')){
        $('#listPosts').remove()
        $('#tableUserInfo').remove()
    }
    $('body').append(
        $(`
        <section class="container d-flex align-items-center justify-content-center  flex-column" id="tableUserInfo">
            <h5>User info:</h5>
            <table class="table table-responsive table-bordered ">
                <tbody>
                    <tr>
                    <th scope="row" class=" ">Name:</th>
                    <td class="ps-4">${listUsers[selectedUser].name}</td>
                    </tr>
                    <tr>
                    <th scope="row" class=" ">Username:</th>
                    <td class="ps-4">${listUsers[selectedUser].username}</td>
                    </tr>
                    <tr>
                    <th scope="row" class=" ">Address:</th>
                    <td class="ps-4">${listUsers[selectedUser].address.street}, ${listUsers[selectedUser].address.city}</td>
                    </tr>
                    <tr>
                    <th scope="row" class=" ">Email:</th>
                    <td class="ps-4">${listUsers[selectedUser].email}</td>
                    </tr>
                    <tr>
                    <th scope="row" class=" ">Phone:</th>
                    <td class="ps-4">${listUsers[selectedUser].phone}</td>
                    </tr>
                    <tr>
                    <th scope="row" class=" ">Website:</th>
                    <td class="ps-4">${listUsers[selectedUser].website}</td>
                    </tr>
                </tbody>
                </table>
                <button class="btn btn-light mb-4" type="button" style="width: 100%;" id='showPosts'>Show posts</button>
        </section>`
        )
    )
    
    $('#showPosts').click(function(){
        loadFetchPosts()
        $('#showPosts').attr('disabled','disabled')
        
    
    })

    
})








