import { courses } from "./data.js";

const courseGrid = document.querySelector(".course-grid");

const totalCredits = document.querySelector("#total-credits");

const searchBox = document.querySelector("#search-courses");

const sortButton = document.querySelector("#sort-btn");

const selectedCourse = document.querySelector("#selected-course");

let displayedCourses = [...courses];

function renderCourses(courseList){

    courseGrid.innerHTML = "";

    let total = 0;

    courseList.forEach(course=>{

        const article=document.createElement("article");

        article.className="course-card";

        article.dataset.id=course.id;

        article.innerHTML=`

        <h2>${course.name}</h2>

        <p><strong>Code:</strong> ${course.code}</p>

        <p><strong>Credits:</strong> ${course.credits}</p>

        <p><strong>Grade:</strong> ${course.grade}</p>

        `;

        courseGrid.appendChild(article);

        total += course.credits;

    });

    totalCredits.textContent=`Total Credits Enrolled : ${total}`;

}

renderCourses(displayedCourses);

// Search

searchBox.addEventListener("input",()=>{

    const searchText=searchBox.value.toLowerCase();

    displayedCourses=courses.filter(course=>

        course.name.toLowerCase().includes(searchText)

    );

    renderCourses(displayedCourses);

});

// Sort

sortButton.addEventListener("click",()=>{

    displayedCourses.sort((a,b)=>b.credits-a.credits);

    renderCourses(displayedCourses);

});

// Event Delegation

courseGrid.addEventListener("click",(event)=>{

    const card=event.target.closest(".course-card");

    if(!card) return;

    const id=Number(card.dataset.id);

    const course=displayedCourses.find(c=>c.id===id);

    selectedCourse.textContent=

    `Selected Course : ${course.name} | Grade : ${course.grade}`;

});