import { courses } from "./data.js";

// Destructuring

console.log("Course Details");

courses.forEach(course => {

    const { name, credits } = course;

    console.log(`${name} - ${credits} Credits`);

});

// Array.map()

const formattedCourses = courses.map(course =>
    `${course.code} — ${course.name} (${course.credits} credits)`
);

console.log("\nFormatted Courses");

console.log(formattedCourses);

// Array.filter()

const filteredCourses = courses.filter(course => course.credits >= 4);

console.log("\nCourses with Credits >= 4");

console.log(filteredCourses);

console.log("Count :", filteredCourses.length);

// Array.reduce()

const totalCredits = courses.reduce((total, course) =>
    total + course.credits, 0
);

console.log("\nTotal Credits Enrolled :", totalCredits);

// Arrow Function Example

const displayCourse = course =>
    `${course.name} (${course.grade})`;

console.log("\nArrow Function Output");

courses.forEach(course => {

    console.log(displayCourse(course));

});