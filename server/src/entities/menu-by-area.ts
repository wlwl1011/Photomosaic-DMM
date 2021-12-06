import { Column, Entity, PrimaryGeneratedColumn,CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity()
export class MenuByArea {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  area_name: string;

  @Column()
  menu_name: string;
  
  @Column()
  menu_img: string;
  
  @Column()
  comment: string;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;
}
