import { courses } from "./data.js";

// Select the course grid

const courseGrid = document.querySelector(".course-grid");

// Select total credits paragraph

const totalCredits = document.querySelector("#total-credits");

// Variable for total

let total = 0;

// Loop through courses

courses.forEach(course => {

    // Create article element

    const article = document.createElement("article");

    // Add class

    article.className = "course-card";

    // HTML Content

    article.innerHTML = `

        <h2>${course.name}</h2>

        <p><strong>Code:</strong> ${course.code}</p>

        <p><strong>Credits:</strong> ${course.credits}</p>

        <p><strong>Grade:</strong> ${course.grade}</p>

    `;

    // Add to page

    courseGrid.appendChild(article);

    // Total Credits

    total += course.credits;

});

// Update Total Credits

totalCredits.textContent = `Total Credits Enrolled : ${total}`;