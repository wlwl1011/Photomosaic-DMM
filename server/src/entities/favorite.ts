import { Column, Entity, PrimaryGeneratedColumn,CreateDateColumn, UpdateDateColumn, ManyToOne, JoinColumn } from 'typeorm';
import { User } from './user';

@Entity({schema:'yummyseoul',name:'favorite'})
export class Favorite {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  user_id: number;

  @Column()
  store_name: string;

  @Column()
  address: string;

  @Column()
  store_img: string;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  @ManyToOne(()=>User , (user)=>user.id, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
  })
  @JoinColumn([ {name:'user_id' , referencedColumnName:'id'}])
  user:User
}
