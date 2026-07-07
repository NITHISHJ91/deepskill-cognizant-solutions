const loading=document.getElementById("loading");

const error=document.getElementById("error");

const retry=document.getElementById("retry-btn");

const notifications=document.getElementById("notifications");

// Reusable Fetch Function

async function apiFetch(url){

    const response=await fetch(url);

    if(!response.ok){

        throw new Error("Unable to load notifications.");

    }

    return await response.json();

}

// Load Notifications

async function loadNotifications(){

    loading.style.display="block";

    error.textContent="";

    retry.style.display="none";

    notifications.innerHTML="";

    try{

        const posts=await apiFetch("https://jsonplaceholder.typicode.com/posts");

        loading.style.display="none";

        posts.slice(0,10).forEach(post=>{

            const card=document.createElement("div");

            card.className="notification";

            card.innerHTML=`

            <h3>${post.title}</h3>

            <p>${post.body}</p>

            `;

            notifications.appendChild(card);

        });

    }

    catch(err){

        loading.style.display="none";

        error.textContent=err.message;

        retry.style.display="block";

    }

}

loadNotifications();

// Simulate 404 Error

async function simulateError(){

    try{

        await apiFetch("https://jsonplaceholder.typicode.com/nonexistent");

    }

    catch(err){

        loading.style.display="none";

        error.textContent="Sorry! Data could not be loaded.";

        retry.style.display="block";

    }

}

// Uncomment the next line to test the 404 error
//simulateError();

retry.addEventListener("click",loadNotifications);