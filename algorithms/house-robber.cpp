class Solution {
public:
    int rob(vector<int>& nums) {        
        if(nums.size()==1) return nums[0];
        int x = nums[0];
        int y = max(x,nums[1]);
        int result = max(x,y);
        for(int i=2;i<nums.size();i++){
            int temp = x;
            x=y;
            y=std::max(temp+nums[i],y);
            result = max(x,y);
        }
        return result;
    }
};