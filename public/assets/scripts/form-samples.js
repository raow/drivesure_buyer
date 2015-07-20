var FormSamples = function () {


    return {
        //main function to initiate the module
        init: function () {

            // use select2 dropdown instead of chosen as select2 works fine with bootstrap on responsive layouts.
            $('.select2_category').select2({
	            placeholder: "Select an option",
	            allowClear: true
	        });

            $('.select2_sample1').select2({
                placeholder: "Select a State",
                allowClear: true
            });

            // $(".select2_sample2").select2({
            //     placeholder: "请输入或选择",
            //     allowClear: true,
            //     minimumInputLength: 1,
            //     query: function (query) {
            //         var data = {
            //             results: []
            //         }, i, j, s;
            //         for (i = 1; i < 5; i++) {
            //             s = "";
            //             for (j = 0; j < i; j++) {
            //                 s = s + query.term;
            //             }
            //             data.results.push({
            //                 id: query.term + i,
            //                 text: s
            //             });
            //         }
            //         query.callback(data);

            //     }
            // });
            $(".select2_sample2").select2({
                placeholder: "搜索姓名",
                minimumInputLength: 1,
                ajax: { // instead of writing the function to execute the request we use Select2's convenient helper
                    url: "/aa_cases/get_clients",
                    dataType: 'json',
                    data: function (term, page) {
                        return {
                            q: term, // search term
                            page_limit: 10,
                           
                        };
                    },
                    results: function (data, page) { // parse the results into the format expected by Select2.
                        // since we are using custom formatting functions we do not need to alter remote JSON data
                        return {results: data.data_sources};
                    }
                },
                formatResult: resultFormatResult, // omitted for brevity, see the source of this page
                formatSelection: resultFormatSelection,  // omitted for brevity, see the source of this page
                dropdownCssClass: "bigdrop", // apply css that makes the dropdown taller
                escapeMarkup: function (m) { return m; } // we do not want to escape markup since we are displaying html in results
            });
            
            $(".select2_sample2").on("select2-selecting", function(e) { 
               $('#phone').val(e.object.mobile);
            })



            $(".select2_sample3").select2({
                tags: ["red", "green", "blue", "yellow", "pink"]
            });

        }

    };

}();