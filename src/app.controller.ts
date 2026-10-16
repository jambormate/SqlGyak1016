import { Body, Controller, Get, Post, Query, Render } from '@nestjs/common';
import { AppService } from './app.service.js';
import { CreateJatekDto } from './ujJatek.dto.js';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Render('index')
  getHello() {
    return {
      title: 'My First NestJS App'
    }
  }

  @Get('macskak')
  @Render('macskak')
  async getMacskak(){
    return{
      macskak: await this.appService.macskaLista(),
      szemszin: '',
    }
  }

  @Get('macskaKeres')
  @Render('macskak')
  async getMacskaBySzemSzin(@Query('szemszin') szemszin?: string) {
    const keresettSzemszin = szemszin?.trim() ?? '';
    return {
      macskak: keresettSzemszin
        ? await this.appService.getMacskaBySzemSzin(keresettSzemszin)
        : await this.appService.macskaLista(),
      szemszin: keresettSzemszin,
    };
  }

  @Get('jatekok')
  @Render('jatekok')
  async getJatekok() {
    return {
      jatekok: await this.appService.jatekLista()
    }
  }

  @Get('ujJatek')
  @Render('ujJatek')
  getUjJatekForm() {
    return {
      nev: '',
      hiba: null,
      letrehozottJatek: null,
    };
  }

  @Post('ujJatek')
  @Render('ujJatek')
  async postUjJatek(@Body() body: CreateJatekDto) {
    const UjJatek = await this.appService.createJatek(body.nev);
    if (!UjJatek) {
      return {
        nev: body.nev,
        hiba: 'A játék neve nem lehet üres!',
        letrehozottJatek: null,
      };
    }

    return {
      nev: body.nev,
      hiba: null,
      letrehozottJatek: UjJatek,
    };
  }
}
