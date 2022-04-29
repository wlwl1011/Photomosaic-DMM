import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn,OneToMany, BaseEntity } from 'typeorm';  
import {Favorite} from './favorite'
import { Review } from './review';
import { ReviewLike } from './review_like';
import { SearchWord } from './search-word';

@Entity() export class User extends BaseEntity {

    @PrimaryGeneratedColumn()     
    id: number;      
    
    @Column()     
    user_name: string;      
    
    @Column()     
    email: string;      
    
    @Column()     
    password: string;      
    
    @Column()     
    user_img: string;  

    @CreateDateColumn()
    created_at: Date
    
    @UpdateDateColumn()
    updated_at: Date

    @OneToMany(()=>Favorite , (favorite)=>favorite.user_id)
    favorite: Favorite[]

    @OneToMany(()=>SearchWord , (searchword)=>searchword.user_id)
    searchword: SearchWord[]

    @OneToMany(()=>Review , (review)=>review.user_id)
    review: Review[]

    @OneToMany(()=>ReviewLike , (reviewlike)=>reviewlike.user_id)
    reviewlike: ReviewLike[]
    findOne: any;

}
