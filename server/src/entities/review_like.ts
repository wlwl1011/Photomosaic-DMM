import { Column, Entity, PrimaryGeneratedColumn,CreateDateColumn, UpdateDateColumn, ManyToOne, JoinColumn} from 'typeorm';
import { User } from './user';
import { Review } from './review';
@Entity()
export class ReviewLike {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  user_id: number;

  @Column()
  review_id: number;

  @ManyToOne(()=>User , (user)=>user.id, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
  })
  @JoinColumn([ {name:'user_id' , referencedColumnName:'id'}])
  user:User

  @ManyToOne(()=>Review , (review)=>review.id, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
  })
  @JoinColumn([ {name:'review_id' , referencedColumnName:'id'}])
  review:Review
}
