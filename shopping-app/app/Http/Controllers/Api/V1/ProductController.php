<?php
namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Food;
use App\Models\Product;

class ProductController extends Controller
{
        
    public function get_popular_products(Request $request){
  
        // $list = Food::where('type_id', 2)->take(100)->orderBy('created_at', 'DESC')->get();
        $list = Food::where('type_id', 2)->where('status', 1)->orderBy('created_at', 'DESC')->take(10)->get();
        
            //dd('kldjf');
        
                foreach ($list as $item){
                    $item['description']=strip_tags($item['description']);
                    $item['description']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['description']); 
                    unset($item['selected_people']);
                    unset($item['people']);
                }
                
                 $data =  [
                    'total_size' => $list->count(),
                    'type_id' => 2,
                    'offset' => 0,
                    'products' => $list
                ];
                
         return response()->json($data, 200);
 
    }
        public function get_recommended_products(Request $request){
        // $list = Food::where('type_id', 3)->take(10)->orderBy('created_at', 'DESC')->get();
        $list = Food::where('type_id', 3)->where('status', 1)->orderBy('created_at', 'DESC')->take(10)->get();

        
                foreach ($list as $item){
                    $item['description']=strip_tags($item['description']);
                    $item['description']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['description']); 
                    unset($item['selected_people']);
                    unset($item['people']);
                }
                
                 $data =  [
                    'total_size' => $list->count(),
                    'type_id' => 3,
                    'offset' => 0,
                    'products' => $list
                ];
                
         return response()->json($data, 200);
    }
    

       public function test_get_recommended_products(Request $request){
  
        $list = Food::skip(5)->take(2)->get();
      
        foreach ($list as $item){
            $item['description']=strip_tags($item['description']);
            $item['description']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['description']); 
        }
        
         $data =  [
            'total_size' => $list->count(),
            'limit' => 5,
            'offset' => 0,
            'products' => $list
        ];
         return response()->json($data, 200);
        // return json_decode($list);
    }
    public function get_drinks(Request $request){
        // $list = Food::where('type_id', 4)->take(10)->orderBy('created_at', 'DESC')->get();
        $list = Food::where('type_id', 4)->where('status', 1)->orderBy('created_at', 'DESC')->take(10)->get();
        
                foreach ($list as $item){
                    $item['description']=strip_tags($item['description']);
                    $item['description']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['description']); 
                    unset($item['selected_people']);
                    unset($item['people']);
                }
                
                 $data =  [
                    'total_size' => $list->count(),
                    'type_id' => 4,
                    'offset' => 0,
                    'products' => $list
                ];
                
         return response()->json($data, 200);
    }
    public function search(Request $request)
    {
        $query = $request->input('query');
        
        $products = Food::where('name', 'like', '%' . $query . '%')
            ->orWhere('description', 'like', '%' . $query . '%')
            ->get();
        
        return response()->json(['products' => $products]);
    }

}
