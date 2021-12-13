import { Column, Entity, PrimaryGeneratedColumn,CreateDateColumn, UpdateDateColumn, OneToMany, ManyToOne, JoinColumn } from 'typeorm';
import { ReviewLike } from './review_like';
import { Store } from './store';
import { User } from './user';
@Entity()
export class Review{
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  user_id: number;

  @Column()
  store_id: number;
  
  @Column()
  comment: string;
  
  @Column()
  rating: number;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  @OneToMany( ()=> ReviewLike , (reviewlike)=>reviewlike.review_id)
  reviewlike :ReviewLike[];
  
  @ManyToOne(()=>User , (user)=>user.id, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
  })
  @JoinColumn([ {name:'user_id' , referencedColumnName:'id'}])
  user:User

  @ManyToOne(()=>Store , (store)=>store.id, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
  })
  @JoinColumn([ {name:'store_id' , referencedColumnName:'id'}])
  store:Store

}
