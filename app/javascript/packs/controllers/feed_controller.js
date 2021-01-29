import { Controller } from 'stimulus'; 
import Rails from '@rails/ujs';
export default class extends Controller {
    static targets = ["entries","pagination"]
    scroll(){
        let url = this.paginationTarget.querySelector("a[rel ='next']").href
        var body = document.body,
            html = document.documentElement
        
        var height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)
        if(window.pageYOffset >= height - window.innerHeight - 300){
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
            } 
        })

    }
}