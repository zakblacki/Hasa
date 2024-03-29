<article class="post--detail">
    <div class="post__header">
        <h1>{!! BaseHelper::clean($post->name) !!}</h1>
        <p>{{ $post->created_at->translatedFormat('d M, Y') }} - @foreach($post->categories as $category) <a href="{{ $category->url }}">{!! BaseHelper::clean($category->name) !!}</a>@if (!$loop->last),@endif @endforeach</p>
    </div>
    <div class="post__content">
        <div class="ck-content">{!! BaseHelper::clean($post->content) !!}</div>
        @if (!$post->tags->isEmpty())
            <strong>{{ __('Tags') }}: </strong>
            <span>
                @foreach ($post->tags as $tag)
                    <a href="{{ $tag->url }}">{{ $tag->name }}</a>@if (!$loop->last),@endif
                @endforeach
            </span>
        @endif
        <br />
        {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, null, $post) !!}
    </div>
</article>
@php $relatedPosts = get_related_posts($post->id, 3); @endphp

@if ($relatedPosts->count())
    <section class="section--related-posts">
        <div class="section__header">
            <h3>{{ __('Related Posts') }}:</h3>
        </div>
        <div class="section__content">
            <div class="row">
                @foreach ($relatedPosts as $relatedItem)
                    <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
                        <article class="post">
                            <div class="post__wrapper">
                                <div class="post__thumbnail"><a class="post__overlay" href="{{ $relatedItem->url }}" title="{{ $post->name }}"></a><img src="{{ RvMedia::getImageUrl($relatedItem->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $relatedItem->name }}" loading="lazy" /></div>
                                <div class="post__content">
                                    <div class="post__header">
                                        <h4 class="post__title"><a href="{{ $relatedItem->url }}">{{ $relatedItem->name }}</a></h4><span> {{ $relatedItem->created_at->translatedFormat('d M, Y') }}</span>
                                    </div>
                                    <p>{{ $relatedItem->description }}</p>
                                </div>
                            </div>
                        </article>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
@endif
