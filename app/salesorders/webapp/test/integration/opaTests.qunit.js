sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ama/logali/salesorders/salesorders/test/integration/FirstJourney',
		'ama/logali/salesorders/salesorders/test/integration/pages/HeaderList',
		'ama/logali/salesorders/salesorders/test/integration/pages/HeaderObjectPage',
		'ama/logali/salesorders/salesorders/test/integration/pages/ItemObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeaderList, HeaderObjectPage, ItemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ama/logali/salesorders/salesorders') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHeaderList: HeaderList,
					onTheHeaderObjectPage: HeaderObjectPage,
					onTheItemObjectPage: ItemObjectPage
                }
            },
            opaJourney.run
        );
    }
);