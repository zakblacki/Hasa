<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        /* CSS styles for error page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #6c757d;
            text-align: center;
            padding: 50px;
        }
        h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
        }
    </style>
</head>
<body>
    @if(isset($error))
        <h1>{{trans("plugins/satim::satim.error")}}</h1>
        <p>{{ $error }}</p>
        <p>{{trans("plugins/satim::satim.please_try_again_later")}}</p>
    @endif

    @if(isset($satimError))
        <h1>{{trans("plugins/satim::satim.satim_error")}}</h1>
        <p>{{trans("plugins/satim::satim.an_error_occurred_while_processing_your_payment")}}</p>
        @if(isset($error))
            <p>{{trans("plugins/satim::satim.error_description")}}: {{ $error }}</p>
        @endif
        @if(isset($satimError['ErrorCode']) && $satimError['ErrorCode']=="0" && isset($satimError['respCode']) && $satimError['respCode'] == "00" && isset($satimError['OrderStatus']) && $satimError['OrderStatus']==3)
            <p>Your transaction was rejected/ تم رفض معاملتك</p>
            <p><span class="d-inline-block" style="color:green">{{trans("plugins/satim::satim.in_case_of_payment_problem_please_contact_the_toll_free_number_of")}}</span> <img class="filter-black" src="{{url('vendor/core/plugins/satim/images/3020.png')}}" alt="satim"></p>
        @else
            @if(isset($satimError['respCode_desc']))
                <p>{{trans("plugins/satim::satim.error_description")}}: {{ $satimError['respCode_desc'] }}</p>
            @else
            <p>{{trans("plugins/satim::satim.error_description")}}: {{ $satimError['actionCodeDescription'] }}</p>
            @endif
            <p><span class="d-inline-block">{{trans("plugins/satim::satim.in_case_of_payment_problem_please_contact_the_toll_free_number_of")}}</span> <img class="filter-black" src="{{url('vendor/core/plugins/satim/images/3020.png')}}" alt="satim"></p>
        @endif
    @endif

    <a href="{{url('/')}}" class="btn btn-primary mt-3">{{trans("plugins/satim::satim.back_to_home")}}</a>
</body>
</html>
