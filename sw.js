const CACHE = 'numeron-premium-v1';
const ASSETS = ['./', './index.html', './manifest.json', './logo.svg'];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS)));
  self.skipWaiting();
});

self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k)))));
  self.clients.claim();
});

self.addEventListener('fetch', e => {
  e.respondWith(caches.match(e.request).then(res => res || fetch(e.request).then(r => {
    if (r.status === 200) {
      const clone = r.clone();
      caches.open(CACHE).then(c => c.put(e.request, clone));
    }
    return r;
  }).catch(() => caches.match('./index.html'))));
});
