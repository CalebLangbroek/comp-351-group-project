import { APIService } from './api-service.js';
import * as CONSTANTS from './constants.js';

window.addEventListener('DOMContentLoaded', () => {
    M.Modal.init(document.querySelectorAll('.modal'));
    const app = new Notes();
    app.init();
});

class Notes {
    api = new APIService();
    constructor() {}

    init() {
        this.setupEventListeners();
        this.getNotes();
    }

    setupEventListeners() {}

    getNotes() {
        this.api
            .get('notes', 'GET')
            .then((notes) => {
                notes.forEach((note) => this.displayNote(note));
            })
            .finally(() => {
                document.getElementById('loading-spinner').remove();
            });
    }

    displayNote(note) {
        const div = document.createElement('div');
        div.classList = ['row'];

        div.innerHTML = `
            <div class="col s12">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title">${note.title}</span>
                        <p>${note.body}</p>
                    </div>
                    <div class="card-action">
                        <a class="waves-effect waves-light btn red"><i class="material-icons left">delete</i>Delete</a>
                        <a class="waves-effect waves-light btn"><i class="material-icons left">edit</i>Edit</a>    
                    </div>
                </div>
            </div>
        `;

        document.getElementById('notes').appendChild(div);
    }

    onCreateNote() {

    }


}
