import { TeamService } from "../services/team.service.js";

export class TeamController {

    constructor() {
        this.teamService = new TeamService();
    }

    async getTeams() {
        return await this.teamService.getTeams();
    }
}

export const teamController = new TeamController();