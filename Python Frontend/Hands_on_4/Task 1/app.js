import { courses } from "./data.js";

// -------------------------
// Promise using then()
// -------------------------

function fetchUser(id){

    return fetch("https://jsonplaceholder.typicode.com/users/" + id)

    .then(response=>response.json())

    .then(user=>{

        console.log("Promise User :",user.name);

        return user;

    });

}

// Call Promise Function

fetchUser(1);

// -------------------------
// Async Await
// -------------------------

async function fetchUserAsync(id){

    try{

        const response=await fetch("https://jsonplaceholder.typicode.com/users/"+id);

        const user=await response.json();

        console.log("Async User :",user.name);

    }

    catch(error){

        console.log(error);

    }

}

fetchUserAsync(1);

// -------------------------
// Simulated Network Delay
// -------------------------

function fetchAllCourses(){

    return new Promise(resolve=>{

        setTimeout(()=>{

            resolve(courses);

        },1000);

    });

}

// -------------------------
// Render Courses
// -------------------------

const grid=document.querySelector(".course-grid");

const loading=document.querySelector("#loading");

fetchAllCourses()

.then(courseList=>{

    loading.style.display="none";

    courseList.forEach(course=>{

        const article=document.createElement("article");

        article.className="course-card";

        article.innerHTML=`

        <h2>${course.name}</h2>

        <p>Code : ${course.code}</p>

        <p>Credits : ${course.credits}</p>

        <p>Grade : ${course.grade}</p>

        `;

        grid.appendChild(article);

    });

});

// -------------------------
// Promise.all()
// -------------------------

Promise.all([

fetch("https://jsonplaceholder.typicode.com/users/1").then(r=>r.json()),

fetch("https://jsonplaceholder.typicode.com/users/2").then(r=>r.json())

])

.then(users=>{

console.log("Promise.all Users");

console.log(users[0].name);

console.log(users[1].name);

});