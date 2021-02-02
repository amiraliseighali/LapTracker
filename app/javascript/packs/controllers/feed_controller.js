import { Controller } from 'stimulus'; 
import Rails from '@rails/ujs';
let throttle = require('lodash/throttle');
export default class extends Controller {
    static targets = ["entries","pagination"]
    initialize(){
        this.scroll = throttle(this.scroll, 2000).bind(this)
      }    
    scroll(){
        let next_page = this.paginationTarget.querySelector("a[rel ='next']")
        if(next_page == null ){ return }
        let url = next_page.href
        var body = document.body,
            html = document.documentElement
        
        
        var height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)
        if(window.pageYOffset >= height - window.innerHeight - 100){

            console.log("loading")
            this.loadMore(url)
        }
    }
    loadMore(url){
        Rails.ajax({
            type: 'Get',
            url: url,
            dataType: 'json',
            success: (data) => {
                console.log(data)
                this.entriesTarget.insertAdjacentHTML('beforeend', data.entries);
                this.paginationTarget.innerHTML = data.pagination
            } 
        })
    }
}