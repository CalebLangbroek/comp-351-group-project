import { APIService } from './api-service.js';

window.addEventListener('DOMContentLoaded', () => {
    M.Modal.init(document.querySelectorAll('.modal'));
    const app = new Notes();
    app.init();
});

class Notes {
    api = new APIService();
    editingId = undefined;

    constructor() {}

    init() {
        this.setupEventListeners();
        this.getNotes();
    }

    setupEventListeners() {
        document
            .getElementById('note-new-submit')
            .addEventListener('click', this.onCreateNote.bind(this));
        document
            .getElementById('note-edit-submit')
            .addEventListener('click', this.onSaveNote.bind(this));
    }

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
        div.id = `note-${note.id}`;

        div.innerHTML = `
            <div class="col s12">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title" id="note-${note.id}-title">
                            ${note.title}
                        </span>
                        <p id="note-${note.id}-body">
                            ${note.body}
                        </p>
                    </div>
                    <div class="card-action">
                        <a class="waves-effect waves-light btn red" id="note-${note.id}-delete">
                            <i class="material-icons left">delete</i>Delete
                        </a>
                        <a class="waves-effect waves-light btn" id="note-${note.id}-edit">
                            <i class="material-icons left">edit</i>Edit
                        </a>    
                    </div>
                </div>
            </div>
        `;

        document.getElementById('notes').appendChild(div);

        document
            .getElementById(`note-${note.id}-delete`)
            .addEventListener('click', this.onDeleteNote.bind(this, note.id));
        document
            .getElementById(`note-${note.id}-edit`)
            .addEventListener('click', this.onEditNote.bind(this, note.id));
    }

    updateNoteDisplay(note) {
        document.getElementById(`note-${note.id}-title`).innerText = note.title;
        document.getElementById(`note-${note.id}-body`).innerText = note.body;
    }

    onCreateNote() {
        const title = document.getElementById('note-new-title').value;
        const body = document.getElementById('note-new-body').value;

        if (!title || !body) {
            document.getElementById('note-new-alert').style.display = '';
            return;
        }

        document.getElementById('note-new-alert').style.display = 'none';

        this.api
            .post('notes', {
                title,
                body,
            })
            .then((res) => {
                this.displayNote({
                    id: res.insertId,
                    title,
                    body,
                });
                M.Modal.getInstance(
                    document.getElementById('note-new-modal')
                ).close();
                document.getElementById('note-new-title').value = '';
                document.getElementById('note-new-body').value = '';
            });
    }

    onDeleteNote(id) {
        this.api.delete(`note/${id}`);
        document.getElementById(`note-${id}`).remove();
    }

    onEditNote(id) {
        this.editingId = id;

        M.Modal.getInstance(document.getElementById('note-edit-modal')).open();

        document.getElementById('note-edit-alert').style.display = 'none';

        document.getElementById(
            'note-edit-title'
        ).value = document.getElementById(`note-${id}-title`).innerText;

        document.getElementById(
            'note-edit-body'
        ).value = document.getElementById(`note-${id}-body`).innerText;

        M.updateTextFields();
    }

    onSaveNote() {
        if (!this.editingId) {
            return;
        }

        const title = document.getElementById('note-edit-title').value;
        const body = document.getElementById('note-edit-body').value;

        if (!title || !body) {
            document.getElementById('note-edit-alert').style.display = '';
            return;
        }

        document.getElementById('note-edit-alert').style.display = 'none';

        this.api.put(`note/${this.editingId}`, {
            title,
            body,
        });

        this.updateNoteDisplay({
            id: this.editingId,
            title,
            body,
        });
        M.Modal.getInstance(document.getElementById('note-edit-modal')).close();
    }
}
