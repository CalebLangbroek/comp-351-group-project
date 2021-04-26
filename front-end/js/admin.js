import { APIService } from './api-service.js';

window.addEventListener('DOMContentLoaded', () => {
    const app = new Admin();
    app.init();
});

class Admin {
    api = new APIService();
    constructor() {}

    init() {
        this.getStats();
    }

    getStats() {
        this.api
            .post('admin', {
                username: 'admin',
                password: 'admin',
            })
            .then((stats) => {
                stats.forEach((stat) => this.displayStat(stat));
                document.getElementById('table').hidden = false;
            })
            .finally(() => {
                document.getElementById('loading-spinner').remove();
            });
    }

    displayStat(stat) {
        const tr = document.createElement('tr');
        tr.classList = [''];

        tr.innerHTML = `
            <td>${stat.endpoint}</td>
            <td>${stat.method}</td>
            <td>${stat.requests}</td>
        `;

        document.getElementById('table-body').appendChild(tr);
    }
}
