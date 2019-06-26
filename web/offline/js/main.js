//check is service worker is supported
if ('serviceWorker' in navigator) {
   // console.log("Service worker Supported");
   window.addEventListener('load',()=>{
       navigator.serviceWorker
               .register('./sw_cached_pages.js')
               .then(reg=> console.log('Service worker:Registered'))
               .catch(err=>console.log(`Service Worker : Error:${err}`));
   });
    
}
