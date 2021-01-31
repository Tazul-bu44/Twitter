<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function index(){
        // SQL Query 01 "who follows user X"
        // let  user id 1 is Mr. X
        $x = DB::table('users')->select('id')->first();
        $followerOfMrX = DB::table('user_relation')->where('followed_id', $x->id)->select('follower_id')->get();
//        dd($followerOfMrX);

        // SQL Query 02 "whom user X follows"
        // let user id 1 is  Mr. X
        $mrXFollows = DB::table('user_relation')->where('follower_id', $x->id)->select('followed_id')->get();
//        dd($mrXFollows);


        // SQL Query 02 "who are friends of X"
        //As per i know Twitter doesn't have any friend option, you might be know some think like if user x is y followed each other then there friend.
        // let user id 1 is  Mr. X
        $followerOfMrXAsAnArray = DB::table('user_relation')->where('followed_id', $x->id)->pluck('follower_id');
        $friendOfMrX = DB::table('user_relation')->whereIn('followed_id', $followerOfMrXAsAnArray)->select('followed_id')->get();

        //all posts from their Mr. x followers, from  Mr. followings, from  Mr. friends.

        $allPosts = DB::table('tweets')
            ->join('user_relation', 'user_relation.follower_id',  '=', 'tweets.user_id' )
            ->select('tweets.content')->get();
        return view('welcome', compact('followerOfMrX', 'mrXFollows', 'friendOfMrX', 'allPosts'));
    }
}
