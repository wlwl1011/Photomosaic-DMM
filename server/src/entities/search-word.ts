import { Column, Entity, PrimaryGeneratedColumn,CreateDateColumn, UpdateDateColumn, ManyToOne, JoinColumn } from 'typeorm';
import { User } from './user';

@Entity()
export class SearchWord {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  user_id: number;

  @Column()
  search_word: string;
  
  @CreateDateColumn()
  created_at: Date;
  
  @ManyToOne(()=>User , (user)=>user.id, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
  })
  @JoinColumn([ {name:'user_id' , referencedColumnName:'id'}])
  user:User
}
