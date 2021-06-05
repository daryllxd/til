---
layout: post
title:  "TIL, 2021-03-17"
date:   2021-03-17 10:45:38 +0800
categories: programming
summary: "Where I..."
---

# The Different Types of Browser Storage
[Reference](https://betterprogramming.pub/the-different-types-of-browser-storage-82b918cb3cf8)

- Use cases:
  - Personalising site preferences.
  - Persisting site activities.
  - Storing login state.
  - Saving data/assets locally.
  - Saving web application-generated documents locally for use offline.
  - Improving website performance.
  - Reducing requests to back-end servers.
- Cookies: Created on the server and sent to the client on response, and the data is exchanged with the server on every request.
  - `document.cookie`. `HTTPOnly` cookie flag can be used to restrict the cookie access in JS to mitigate some of the security issues.
  - Session cookies: don't specify the `Expires` or `Max-Age` attributes and are removed when the browser is closed.
  - Persistent: Have `Expires` or `Max-Age` attributes - won't be expired on closing the browser but will expire at a specific date or length of time.
  - Restrictions: 4KB of data. Number of cookies allowed on a domain is restricted based on the browser (e.g. 20). Total number cookies across all domains is restricted - when the limit is reached, the oldest cookie is removed. Cookie data is sent to the server on every request. Sharing data with third parties is allowed. Recommended to use modern storage APIs whenever possible.
- Web Storage API
  - 5MB - stored client-side only. Data can't be shared between domains, including subdomains. Each origin will have unique storage.
  - `localStorage`: Stores the data with no expiration date. Data won't be deleted when the browser is closed and will be available in the next day, week, or year - until deleted by the website or by the user.
  - `sessionStorage` is equal to the `localStorage` except it stores the data for only one session. The data is deleted when the user closes the specific browser tab.
  - *The Web Storage API calls are synchronous, so they may impact the UI rendering.* Use the Web Storage API for storing and retrieving a minimal amount of data. The Web Storage API is very easy to use for storing and retrieving data on users’ browsers — all of the modern browsers support the Web Storage API.
- IndexedDB Storage
  - JS-based object-oriented database. This lets your store and retrieve objects that are indexed with a key - any objects supported by the structured-clone algorithm can be stored.
  - Can persistently store a large amount of data inside a user's browser. Synchronous, doesn't block UI rendering. Size is based on the browser implementation.

```
//Check for browser support
if (window.indexedDB) {

  //Sample data
  const customerData = [{ ssn: "444-44-4444", name: "test1", age: 35, email: "test1@company.com" },
              { ssn: "555-55-5555", name: "test2", age: 32, email: "test2@home.org" }];
  const dbName = "testDB";
  var db;
  //open the db, the db is created if not exist already
  //Specify DB name and version, update the version number if the DB structure need to be modified
  var request = indexedDB.open(dbName, 2);

  //Error Handler
  request.onerror = function(event) {
    console.log("error: ");
  };

  //Success Handler
  request.onsuccess = function(event) {
    db = request.result;
    console.log("success: "+ db);
  };

  //Handler invoked on successful opening of database
  //Upgrade the existing DB object if the version is different or create the objects
  request.onupgradeneeded = function(event) {
    var db = event.target.result;

    // autoIncrement: true
    //Create Object store with primary key
    var objectStore = db.createObjectStore("customers", { keyPath: "ssn" });

    //Define the required Indexes
    objectStore.createIndex("name", "name", { unique: false });
    objectStore.createIndex("email", "email", { unique: true });

    //Add data to the object
    customerData.forEach(function(customer) {
        objectStore.add(customer);
    });

  };
```


- Web SQL database
  - Based on SQLite, can be used in supported browsers like Safari, Chrome, Opera, and Edge.
- CacheStorage
  - Can be used with Service Worker API to enable offline access. Can fetch and cache the data from crossorigin websites. Asynchronous, won't block UI rendering.

## Summary

- Use the CacheStorage API to store the data for offline access.
- IndexedDB is the better choice for storing a large amount of applications or user-generated data.
- Cookies still can be used to store the minimal data the server requires to identify the state.
- The local storage and session storage can be used to store a minimal amount of data. Local storage and session storage APIs are synchronous, so they’ll impact the UI rendering. But it’s easy to enable the API into the project.
