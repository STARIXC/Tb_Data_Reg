//declare a cache name
var cacheName = 'v2';
var cacheFiles = [
    '/',
    'index.jsp',
    'pouchdb-7.0.0.js',
    'pouchdb-7.0.0.min.js',
    'pouchdb.find.min.js',
    'pouchdb.find.js',
    'service-worker.js',
    'assets/bootstrap/css/bootstrap.min.css',
    'assets/bootstrap/css/bootstrap-glyphicons.min.css',
    'assets/bootstrap/maps/glyphicons-fontawesome.min.css',
    'css/footable.bootstrap.css',
    'css/select2.min.css',
    'assets/bootstrap/css/bootstrap-formhelpers.min.css',
    'assets/calender/lib/jquery-ui.min.css',
    'assets/font-awesome/css/font-awesome.min.css',
    'assets/font-awesome/font/FontAwesome.otf',
    'assets/font-awesome/font/fontawesome-webfont.eot',
    'assets/font-awesome/font/fontawesome-webfont.ttf',
    'assets/font-awesome/font/fontawesome-webfont.woff',
    'assets/bootstrap/fonts/fontawesome/fa-brands-400.eot',
    'assets/bootstrap/fonts/fontawesome/fa-brands-400.svg',
    'assets/bootstrap/fonts/fontawesome/fa-brands-400.ttf',
    'assets/bootstrap/fonts/fontawesome/fa-brands-400.woff',
    'assets/bootstrap/fonts/fontawesome/fa-brands-400.woff2',
    'assets/bootstrap/fonts/fontawesome/fa-regular-400.eot',
    'assets/bootstrap/fonts/fontawesome/fa-regular-400.svg',
    'assets/bootstrap/fonts/fontawesome/fa-regular-400.ttf',
    'assets/bootstrap/fonts/fontawesome/fa-regular-400.woff',
    'assets/bootstrap/fonts/fontawesome/fa-regular-400.woff2',
    'assets/bootstrap/fonts/fontawesome/fa-solid-900.eot',
    'assets/bootstrap/fonts/fontawesome/fa-solid-900.svg',
    'assets/bootstrap/fonts/fontawesome/fa-solid-900.ttf',
    'assets/bootstrap/fonts/fontawesome/fa-solid-900.woff',
    'assets/bootstrap/fonts/fontawesome/fa-solid-900.woff2',
    'assets/bootstrap/fonts/glyphicons/glyphicons-halflings-regular.eot',
    'assets/bootstrap/fonts/glyphicons/glyphicons-halflings-regular.svg',
    'assets/bootstrap/fonts/glyphicons/glyphicons-halflings-regular.ttf',
    'assets/bootstrap/fonts/glyphicons/glyphicons-halflings-regular.woff',
    'assets/bootstrap/fonts/glyphicons/glyphicons-halflings-regular.woff2',
    'assets/glyphicons/fonts/glyphicons-regular.eot',
    'assets/glyphicons/fonts/glyphicons-regular.otf',
    'assets/glyphicons/fonts/glyphicons-regular.svg',
    'assets/glyphicons/fonts/glyphicons-regular.ttf',
    'assets/glyphicons/fonts/glyphicons-regular.woff',
    'assets/offcanvas.css',
    'assets/DT-Tables/js/jquery-3.3.1.min.js',
    'assets/bootstrap/js/bootstrap.min.js',
    'js/jquery.validate.min.js',
    'js/select2.min.js',
    'js/additional/additional.js',
    'js/footable.js',
    'assets/popper.min.js',
    'assets/offcanvas.js',
    'assets/bootstrap/js/bootstrap-formhelpers.js',
    'assets/calender/lib/jquery-ui.min.js',
    'js/form_1.js',
    'js/app.js',
    'js/datepicker.js'

];





//install event listener
self.addEventListener('install', e => {
    console.log("[ServiceWorker] Installed");
    e.waitUntil(
            caches.open(cacheName).then(cache => {
        console.log("[serviceWorker] caching cacheFiles");
        cache.addAll(cacheFiles);
    }).then(() => self.skipWaiting())
            );
});
//install event listener
self.addEventListener('activate', function (e) {
    console.log("[ServiceWorker] Activated");
//remove unwanted caches
    e.waitUntil(
            caches.keys().then(cacheNames => {
        return Promise.all(cacheNames.map(cache => {
            if (cache !== cacheName) {
                console.log("[service worker] Clearing old caches");
                return caches.delete(cache);

            }
        })
                );
    })
            );
});
//call Fetch Event
self.addEventListener('fetch', e => {
    console.log("[Service Worker] Fetching");
    //fetch if cache exists if not load from caches
    e.respondWith(fetch(e.request).catch(() => caches.match(e.request)));
});