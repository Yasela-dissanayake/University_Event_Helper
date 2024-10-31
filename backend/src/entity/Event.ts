import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class Event {
  @PrimaryGeneratedColumn()
  id: number = 0;

  @Column()
  title: string = "";

  @Column()
  date: string = "";

  @Column()
  time: string = "";

  @Column()
  location: string = "";

  @Column()
  ssid: string = "";
}