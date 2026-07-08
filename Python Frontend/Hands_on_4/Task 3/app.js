// ======================================================
// Hands-On 4 - Task 3
// Introduction to Axios
// ======================================================


// ------------------------------------------------------
// Fetch vs Axios Comparison
// ------------------------------------------------------

/*
Difference 1:
Fetch requires response.json() to convert the response.
Axios automatically converts the response into JSON.

Difference 2:
Fetch does not throw an error for HTTP errors (404,500).
Axios automatically throws an error for non-2xx responses.

Difference 3:
Fetch is built into modern browsers.
Axios is an external library with extra features like
interceptors, timeout, request cancellation etc.
*/


// ------------------------------------------------------
// Request Interceptor (Step 58)
// ------------------------------------------------------

axios.interceptors.request.use(

    function(config){

        console.log("API call started :", config.url);

        return config;

    },

    function(error){

        return Promise.reject(error);

    }

);


// ------------------------------------------------------
// Reusable Axios Function (Step 56)
// ------------------------------------------------------

async function apiFetch(url, params = {}){

    const response = await axios.get(

        url,

        {

            params: params,

            timeout:5000

        }

    );

    return response.data;

}


// ------------------------------------------------------
// DOM Elements
// ------------------------------------------------------

const loadButton = document.getElementById("loadBtn");

const loading = document.getElementById("loading");

const notifications = document.getElementById("notifications");


// ------------------------------------------------------
// Render Notification Cards
// ------------------------------------------------------

function renderPosts(posts){

    notifications.innerHTML = "";

    posts.forEach(post=>{

        const card = document.createElement("div");

        card.className = "notification";

        card.innerHTML = `

            <h3>${post.title}</h3>

            <p>${post.body}</p>

        `;

        notifications.appendChild(card);

    });

}


// ------------------------------------------------------
// Load Posts using Axios
// ------------------------------------------------------

async function loadPosts(){

    loading.classList.remove("hidden");

    notifications.innerHTML = "";

    try{

        // Step 57
        const posts = await apiFetch(

            "https://jsonplaceholder.typicode.com/posts",

            {

                userId:1

            }

        );

        renderPosts(posts);

    }

    catch(error){

        notifications.innerHTML =

        `

        <p class="error">

        Unable to load notifications.

        </p>

        `;

        console.log(error);

    }

    finally{

        loading.classList.add("hidden");

    }

}


// ------------------------------------------------------
// Button Click Event
// ------------------------------------------------------

loadButton.addEventListener(

    "click",

    loadPosts

);