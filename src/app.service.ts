import { Injectable } from '@nestjs/common';
import mysql from 'mysql2/promise';
import { Macska } from './macska.js';
import type { Jatek } from './jatek.js';

const mysqlConnection = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'macskak'
})

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }

  async macskaLista(){
    const [results] = await mysqlConnection.execute('SELECT id, suly, szem_szin, gazdi_id, jatek_id FROM macskak')
    const rows = results as Macska[]
    return rows
  }

  async jatekLista(){
    const [results] = await mysqlConnection.execute('SELECT id, nev FROM jatekok')
    const rows = results as Jatek[]
    return rows
  }

  async getMacskaBySzemSzin(szemszin: string) {
    const [rows] = await mysqlConnection.execute('SELECT id, suly, szem_szin, gazdi_id, jatek_id FROM macskak WHERE szem_szin = ?', [szemszin])
      return rows
  }

  async createJatek(nev: string){
    if (typeof nev !== 'string' || nev.trim() === '') {
      return null;
    }

    const jatekNev = nev.trim();
    const [results] = await mysqlConnection.execute(
      'INSERT INTO jatekok (nev) VALUES (?)', [jatekNev],);
    const rows = results as any
    return{
      id: rows.insertId, nev
    } as Jatek
  }

}
