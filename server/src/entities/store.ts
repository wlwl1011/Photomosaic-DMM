import { Column, Entity, PrimaryGeneratedColumn,CreateDateColumn, UpdateDateColumn, OneToMany } from 'typeorm';
import { Review } from './review';

@Entity()
export class Store {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  menu_name: string

  @Column()
  area_name: string

  @Column()
  store_name: string;

  @Column()
  address: string;
  
  @Column()
  open_time: string;
  
  @Column()
  phone_number: string;

  @Column()
  store_img: string;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  @OneToMany(()=>Review , (review)=>review.store_id)
    review: Review[]
}
