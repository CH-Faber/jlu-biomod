gsap.registerPlugin(ScrollTrigger) 

let floatDiv = document.querySelector('.tp');
window.addEventListener('scroll',()=>{
    let top = document.documentElement.scrollTop;
    if(top>20){
        floatDiv.classList.add('show');}
        else{
            floatDiv.classList.remove('show');
        }
})
const f = gsap.timeline()
/*ScrollTrigger.create({
    trigger:'.fb1',
    start:'top top',
    end: '+=900',
    scrub:true,
    pin:true,
    markers:true,                               
    animation:   
    gsap.timeline()
.from('.ab1',{ opacity:0,x:-1000})
.from('.ab2',{opacity:0,y:-500})
})*/

const t = gsap.timeline()
t.to('.D',{duration: 0.8, opacity:1})
t.to('.O',{duration: 0.5, opacity:1})
t.to('.A',{duration:0.5, opacity:1})
t.to('.R',{duration: 0.5, opacity:1})
t.to('.A2',{duration: 0.5, opacity:1})
t.to('.S1',{duration:0.5, opacity:1})
t.from('.p',{opacity:0,duration:1.5,rotation:360})
/*gsap.from('.doara',{y:-1200,duration:2,ease:'bounce'})*/

ScrollTrigger.create({
    trigger:'.TT',
    start:'+=-200',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T4',{opacity:0 ,duration:0.6})
.from('.T5',{opacity:0, duration:0.6})
.from('.T6', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT1',
    start:'+=-200',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T8',{opacity:0 ,duration:0.6})
.from('.T9',{opacity:0, duration:0.6})
.from('.T10', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT2',
    start:'+=-200',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T12',{opacity:0 ,duration:0.6})
.from('.T13',{opacity:0, duration:0.6})
.from('.T14', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT3',
    start:'+=-300',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T16',{opacity:0 ,duration:0.6})
.from('.T17',{opacity:0, duration:0.6})
.from('.T18', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT4',
    start:'+=-300',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T20',{opacity:0 ,duration:0.6})
.from('.T21',{opacity:0, duration:0.6})
.from('.T22', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT5',
    start:'+=-300',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T24',{opacity:0 ,duration:0.6})
.from('.T25',{opacity:0, duration:0.6})
.from('.T26', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT6',
    start:'+=-400',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T28',{opacity:0 ,duration:0.6})
.from('.T29',{opacity:0, duration:0.6})
.from('.T30', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT7',
    start:'+=-400',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T32',{opacity:0 ,duration:0.6})
.from('.T33',{opacity:0, duration:0.6})
.from('.T34', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT8',
    start:'+=-400',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T36',{opacity:0 ,duration:0.6})
.from('.T37',{opacity:0, duration:0.6})
.from('.T38', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT9',
    start:'+=-400',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T40',{opacity:0 ,duration:0.6})
.from('.T41',{opacity:0, duration:0.6})
.from('.T42', {opacity:0, duration:0.6})
})
ScrollTrigger.create({
    trigger:'.TT10',
    start:'+=-400',
    end: '+=480',
    animation:   
    gsap.timeline()
    .from('.T44',{opacity:0 ,duration:0.6})
.from('.T45',{opacity:0, duration:0.6})
.from('.T46', {opacity:0, duration:0.6})
})

ScrollTrigger.create({
    trigger:'.fb2',
    start:'+=-300',
    end: '+=480',
    animation:
    gsap.timeline()
    .from('.ab3',{opacity:0,duration:0.5 })
    .from('.ab4',{opacity:0, duration:0.5})
})

ScrollTrigger.create({
    trigger:'.fb3',
    start:'+=-300',
    end: '+=480',
    animation:
    gsap.timeline()
    .from('.ab5',{opacity:0,duration:0.5 })
    .from('.ab6',{opacity:0, duration:0.5})
})

ScrollTrigger.create({
    trigger:'.fb4',
    start:'+=-300',
    end: '+=480',
    animation:
    gsap.timeline()
    .from('.ab7',{opacity:0,duration:0.5 })
    .from('.ab8',{opacity:0, duration:0.5})
})

ScrollTrigger.create({
    trigger:'.fb5',
    start:'+=-300',
    end: '+=480',
    animation:
    gsap.timeline()
    .from('.ab9',{opacity:0,duration:0.5 })
    .from('.ab10',{opacity:0, duration:0.5})
})



