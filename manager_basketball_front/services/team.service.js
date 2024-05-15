import { HandleHttpRequest } from "./handleHttpRequest.js";

export class TeamService extends HandleHttpRequest {
    constructor() {
        super();
    }
    /* Devuelve todos los equipos */
    /* Toda funcion que tenga que realizar una espera con el await debe ser declara como asincrona */
    async getTeams() {
        try {
            return await this.httpRequest('GET', 'teams');
        } catch (error) {
            return [];
        }
    }

    /* Devuelve los datos de un equipo dado */
    getTeam(id) {

    }

    /* Crea un equipo */
    postTeam(body) {

    }

    /* Actualiza un equipo dado */
    putTeam(id, body) {

    }

    /* Borra un equipo dado */
    deleteTeam(id) {

    }
}