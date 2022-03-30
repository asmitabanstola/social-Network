<?php
//similarity distance
function similarity_distance($rating_matrix,$X,$Y){
	$similar=array();
	$sum=0;
	foreach($rating_matrix[$X] as $key=>$value){
		if(array_key_exists($key,$rating_matrix[$Y])){
			$similar[$key]=1;
		}
	}
		if($similar==0){
			return 0;
		}
		foreach($rating_matrix[$X] as $key=>$value){
		if(array_key_exists($key,$rating_matrix[$Y])){
			//Euclidean distance
			$sum=$sum+pow($value-$rating_matrix[$Y][$key],2);
		}
	}
	return 1/(1+sqrt($sum));
}

function getRecommendation($rating_matrix,$Z){
	$total=array();
	$totalsimilarity=array();
	$order=array();
	foreach ($rating_matrix as $W=>$value){
		if($W!=$Z){
			$sim=similarity_distance($rating_matrix,$Z,$W);
			foreach($rating_matrix[$W] as $key=>$value){
				if(!array_key_exists($key,$rating_matrix[$Z])){
					if(!array_key_exists($key,$total)){
						$total[$key]=0;
					}
					//predict similarity
					$total[$key]+=$rating_matrix[$W][$key]*$sim;
					if(!array_key_exists($key,$totalsimilarity)){
						$totalsimilarity[$key]=0;
					}
					$totalsimilarity[$key]+=$sim;
				}
			}

		}
	}
	
	foreach($total as $key=>$value){
		//Normalization 
		$order[$key]=$value/$totalsimilarity[$key];
		
	}
	array_multisort($order,SORT_DESC);
		return $order;
}
?>