// class Solution {
// public:
//     int maxProfit(vector<int>& prices) {
//         std::vector<int> min_till_date(prices.size());
//         std::vector<int> max_in_future(prices.size());
//         for(int i =0; i < prices.size(); i++){
//           if(i==0) min_till_date[i] = prices[i];
//           else min_till_date[i] = std::min(min_till_date[i-1],min_till_date[i]);
//         }
//         for(int i =prices.size()-1;i >0; i--){
//           if(i==prices.size()-1) max_in_future[i] = prices[i];
//           else max_in_future[i] = std::max(max_in_future[i+1],max_in_future[i]);
//         }
//         int result = 0;
//         for(int i =0; i < prices.size(); i++){
//           result = std::max(result,max_in_future[i]-min_till_date[i]);
//         }
//         return result;
//     }
// };

class Solution {
public:
    int maxProfit(vector<int>& prices) {

        int result = 0;
        for(int i =0; i < prices.size(); i++){
          int min_till_date;
          if(i==0) min_till_date = prices[i];
          else min_till_date = std::min(min_till_date,prices[i]);

          result = std::max(result,prices[i]-min_till_date);
        }
        return result;
    }
};