const cacheName = 'v2';

// Call Install Event
self.addEventListener('install', e => {
    console.log('Service Worker: Installed');
});
function getObjectStore (storeName, mode) {
  // retrieve our object store
  return our_db.transaction(storeName,mode
   ).objectStore(storeName);
};
function savePostRequests (url, payload) {
  // get object_store and save our payload inside it
  var request = getObjectStore(FOLDER_NAME, 'readwrite').add({
    url: url,
    payload: payload,
    method: 'POST'
  });
  request.onsuccess = function (e) {
    console.log('a new pos_ request has been added to indexedb');
  };
  request.onerror = function (error) {
    console.error(error);
  };
};
// Call Activate Event
self.addEventListener('activate', e => {
    console.log('Service Worker: Activated');
    // Remove unwanted caches
    e.waitUntil(
            caches.keys().then(cacheNames => {
        return Promise.all(
                cacheNames.map(cache => {
                    if (cache !== cacheName) {
                        console.log('Service Worker: Clearing Old Cache');
                        return caches.delete(cache);
                    }
                })
                );
    })
            );
});

// Call Fetch Event

self.addEventListener('fetch', e => {
 console.log('Service Worker: Fetching');
 e.respondWith(
 fetch(e.request)
 .then(res => {
 // Make copy/clone of response
 const resClone = res.clone();
 // Open cahce
 caches.open(cacheName).then(cache => {
 // Add response to cache
 cache.put(e.request, resClone);
 });
 return res;
 })
 .catch(err => caches.match(e.request).then(res => res))
 );
 });

function openDatabase() {
    //if db doesnt exist create one
   


}















