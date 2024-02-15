@foreach ($reviews as $review)
    @continue(! $review->is_approved && auth('customer')->id() != $review->customer_id)

    <div @class(['row pb-3 mb-3 review-item', 'border-bottom' => ! $loop->last, 'opacity-50' => ! $review->is_approved])>
        <div class="col-auto">
            <img class="rounded-circle" src="{{ $review->user->avatar_url }}" alt="{{ $review->user->name }}" width="60">
        </div>
        <div class="col">
            <div class="d-flex flex-wrap align-items-center gap-2 mb-2 review-item__header">
                <div class="fw-medium">
                    {{ $review->user->name }}
                </div>
                <time class="text-muted small" datetime="{{ $review->created_at->translatedFormat('Y-m-d\TH:i:sP') }}">
                    {{ $review->created_at->diffForHumans() }}
                </time>
                @if ($review->order_created_at)
                    <div class="small text-muted">{{ __('✅ Purchased :time', ['time' => $review->order_created_at->diffForHumans()]) }}</div>
                @endif
                @if (! $review->is_approved)
                    <div class="small text-warning">{{ __('Waiting for approval') }}</div>
                @endif
            </div>

            <div class="mb-2 review-item__rating">
                <div class="bb-product-rating">
                    <span style="width: {{ $review->star * 20 }}%"></span>
                </div>
            </div>

            <div class="review-item__body">
                {{ $review->comment }}
            </div>

            @if ($review->images)
                <div class="review-item__images mt-3">
                    <div class="row g-1 review-images">
                        @foreach ($review->images as $image)
                            <a href="{{ RvMedia::getImageUrl($image) }}" class="col-3 col-md-2 col-xl-1 position-relative">
                                <img src="{{ RvMedia::getImageUrl($image, 'thumb') }}" alt="{{ $review->comment }}" class="img-thumbnail">
                            </a>
                        @endforeach
                    </div>
                </div>
            @endif
        </div>

        @if ($review->reply)
            <div class="review-item__reply mt-4">
                <div class="position-relative row py-3 rounded bg-light">
                    <div class="col-auto">
                        <img class="rounded-circle" src="{{ $review->reply->user->avatar_url }}" alt="{{ $review->reply->user->name }}" width="50">
                    </div>
                    <div class="col">
                        <div class="d-flex flex-wrap align-items-center gap-2 mb-2 review-item__header">
                            <div class="fw-medium">
                                {{ $review->reply->user->name }}
                            </div>
                            <span class="badge bg-primary">
                                {{ __('Admin') }}
                            </span>
                            <time class="text-muted small" datetime="{{ $review->reply->created_at->translatedFormat('Y-m-d\TH:i:sP') }}">
                                {{ $review->reply->created_at->diffForHumans() }}
                            </time>
                        </div>

                        <div class="review-item__body">
                            {{ $review->reply->message }}
                        </div>
                    </div>
                </div>
            </div>
        @endif
    </div>
@endforeach

{{ $reviews->links() }}
