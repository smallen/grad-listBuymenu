#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_lbm {
    class common {
        file = MODULES_DIRECTORY\grad-listBuymenu\functions;
        class addInteraction {};
        class getPicturePath {};
        class getStock {};
        class loadBuymenu {};
    };

    class buy {
        file = MODULES_DIRECTORY\grad-listBuymenu\functions\buy;
        class buyClient {};
        class buyServer {};
        class buyWeapon {};
        class reimburse {};
    };

    class init {
        file = MODULES_DIRECTORY\grad-listBuymenu\functions\init;
        class initClient {
            postInit = 1;
        };
        class initStocks {
            postInit = 1;
        };
    };

    class update {
        file = MODULES_DIRECTORY\grad-listBuymenu\functions\update;
        class updateBuyButton {};
        class updateCategories {};
        class updateFunds {};
        class updateItemData {};
        class updateList {};
    };
};
