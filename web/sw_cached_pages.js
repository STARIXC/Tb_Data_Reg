const cacheName = 'v1';
const cacheAssets = [
    'index.jsp',
    'pouchdb-7.0.0.js',
    'pouchdb-7.0.0.min.js',
    'assets/bootstrap/css/bootstrap.min.css',
    'assets/bootstrap/css/bootstrap-glyphicons.min.css',
    'assets/bootstrap/maps/glyphicons-fontawesome.min.css',
    'css/footable.bootstrap.css',
    'css/select2.min.css',
    'assets/bootstrap/css/bootstrap-formhelpers.min.css',
    'assets/calender/lib/jquery-ui.min.css',
    'assets/font-awesome/css/font-awesome.min.css',
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
    'js/datepicker.js'
];


// call install event

self.addEventListener('install', (e) => {
    console.log('Service Worker : Installed');
    e.waitUntil(
            caches
            .open(cacheName)
            .then(cache => {
                console.log('Service worker: Catching Files');
                cache.addAll(cacheAssets);
            })
            .then(() => self.skipWaiting())
            );
});

// call activate event

self.addEventListener('activate', (e) => {
    console.log('Service Worker : Activated');
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
//call fetch Event
self.addEventListener('fetch', e => {
  console.log('Service Worker: Fetching');
  //check if live site is availabe
  e.respondWith(fetch(e.request).catch(() => caches.match(e.request)));
});