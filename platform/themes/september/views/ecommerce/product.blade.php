@php
    Theme::layout('full-width');
    Theme::asset()->usePath()->add('lightGallery-css', 'plugins/lightGallery/css/lightgallery.min.css');
    Theme::asset()->container('footer')->usePath()
        ->add('lightGallery-js', 'plugins/lightGallery/js/lightgallery.min.js', ['jquery']);

    $product->loadMissing('productLabels');
@endphp

<main class="page--inner page--product--detail">
    <div class="container">
        <article class="product--detail">
            <div class="product__header">
                <div class="product__thumbnail">
                    <figure>
                        <div class="wrapper">
                            <div class="product__gallery" data-arrow="true">
                                @foreach ($productImages as $img)
                                    <div class="item">
                                        <a href="{{ RvMedia::getImageUrl($img) }}">
                                          <div class="zoom">
                                            <img src="{{ RvMedia::getImageUrl($img) }}" alt="{{ $product->name }}" loading="lazy" />
                                          </div>
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </figure>
                    <div class="product__variants product__thumbs" data-vertical="true" data-item="5" data-md="3" data-sm="3" data-arrow="false">
                        @foreach ($productImages as $thumb)
                            <div class="item">
                                <img src="{{ RvMedia::getImageUrl($thumb, 'thumb') }}" alt="{{ $product->name }}" loading="lazy" />
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="product__info">
                    <div class="product__info-header">
                        <h2 class="product__title">{!! BaseHelper::clean($product->name) !!}</h2>&nbsp;<span class="stock-status-label">({!! $product->stock_status_html !!})</span>
                    </div>
                    <div>
                        <div>
                            <!--
                            @if ($product->sku)
                                <span class="d-inline-block">{{ __('SKU') }}:</span> <span id="product-sku" class="sku d-inline-block" itemprop="sku">{{ $product->sku }}</span>
                            @endif
                            -->
                            @if (EcommerceHelper::isReviewEnabled())
                                @if ($product->reviews_count > 0)
                                    @if ($product->sku) - @endif
                                    <div class="rating_wrap d-inline-block">
                                        <div class="rating">
                                            <div class="product_rate" style="width: {{ $product->reviews_avg * 20 }}%"></div>
                                        </div>
                                        <span class="rating_num">({{ $product->reviews_count }})</span>
                                    </div>
                                @endif
                            @endif
                        </div>
                    </div>

                    <div class="product__price @if ($product->front_sale_price !== $product->price) sale @endif">
                        <p>
                            <span class="product-sale-price-text">{{ format_price($product->front_sale_price_with_taxes) }}</span>&nbsp;
                            <small><del class="product-price-text" @if ($product->front_sale_price == $product->price) style="display: none" @endif>{{ format_price($product->price_with_taxes) }}</del></small>
                        </p>
                        <p>
                            @if (EcommerceHelper::isWishlistEnabled())
                                <a class="product__add-wishlist add-to-wishlist-button" href="#" data-url="{{ route('public.wishlist.add', $product->id) }}" data-add-text="{{ __('Add to wishlist') }}" data-added-text="{{ __('Added to wishlist') }}"><i class="fa fa-heart-o"></i>
                                    <span>{{ __('Add to wishlist') }}</span>
                                </a>
                            @endif
                            @if (EcommerceHelper::isCompareEnabled())
                                <a class="product__add-wishlist ml-3 js-add-to-compare-button" data-url="{{ route('public.compare.add', $product->id) }}" href="#"><i class="feather icon icon-plus-circle"></i> <span>{{ __('Compare') }}</span></a>
                            @endif
                        </p>
                    </div>
                    <div class="product__desc">
                        {!! apply_filters('ecommerce_before_product_description', null, $product) !!}
                        <div>{!! BaseHelper::clean($product->description) !!}</div>
                        {!! apply_filters('ecommerce_after_product_description', null, $product) !!}
                    </div>
                    <div class="product__shopping">
                        @if (EcommerceHelper::isCartEnabled())
                            <form class="single-variation-wrap add-to-cart-form" method="POST" action="{{ route('public.cart.add-to-cart') }}">
                                @csrf

                                @if ($product->variations()->count() > 0)
                                    {!! render_product_swatches($product, [
                                        'selected' => $selectedAttrs,
                                        'view' => Theme::getThemeNamespace() . '::views.ecommerce.attributes.swatches-renderer'
                                    ]) !!}
                                @endif

                                {!! render_product_options($product) !!}

                                {!! apply_filters(ECOMMERCE_PRODUCT_DETAIL_EXTRA_HTML, null, $product) !!}
                                <input type="hidden" name="id" class="hidden-product-id" value="{{ ($product->is_variation || !$product->defaultVariation->product_id) ? $product->id : $product->defaultVariation->product_id }}"/>
                                <div class="form-group product__attribute product__qty">
                                    <label for="qty-input">{{ __('Qty') }}</label>
                                    <div class="form-group__content">
                                        <div class="form-group--number">
                                            <button type="button" class="up"></button>
                                            <input class="form-control qty-input" name="qty" type="number" value="1" id="qty-input">
                                            <button type="button" class="down"></button>
                                        </div>

                                        <div class="float-right number-items-available" style="@if (!$product->isOutOfStock()) display: none; @endif line-height: 45px;">
                                            @if ($product->isOutOfStock())
                                                <span class="text-danger">({{ __('Out of stock') }})</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" @if ($product->isOutOfStock()) disabled @endif class="btn--custom btn--outline btn--rounded btn-add-cart @if (!EcommerceHelper::isQuickBuyButtonEnabled()) btn--fullwidth @endif @if ($product->isOutOfStock()) btn-disabled @endif">
                                    {{ __('Add to cart') }}
                                </button>
                                @if (EcommerceHelper::isQuickBuyButtonEnabled())
                                    &nbsp;
                                    <button type="submit" name="checkout" @if ($product->isOutOfStock()) disabled @endif class="btn--custom btn--rounded btn-add-cart @if ($product->isOutOfStock()) btn-disabled @endif">
                                        {{ __('Quick Buy') }}
                                    </button>
                                @endif
                                <div class="success-message text-success" style="display: none;">
                                    <span></span>
                                </div>
                                <div class="error-message text-danger" style="display: none;">
                                    <span></span>
                                </div>
                            </form>
                        @endif
                    </div>

                    @if (!$product->tags->isEmpty())
                        <figure class="product__tags">
                            <figcaption>{{ __('Tags') }}:</figcaption>
                            @foreach ($product->tags as $tag)
                                <a href="{{ $tag->url }}">
                                    {{ $tag->name }}
                                </a>
                            @endforeach
                        </figure>
                    @endif
                    <figure class="product__sharing">
                        <figcaption>{{ __('Share') }}:</figcaption>
                        <ul class="list--social">
                            <li><a href="https://www.facebook.com/sharer/sharer.php?u={{ urlencode(url()->current()) }}&title={{ rawurldecode(strip_tags(SeoHelper::getDescription())) }}" target="_blank" title="{{ __('Share on Facebook') }}"><i class="feather icon icon-facebook"></i></a></li>
                            <li><a href="https://wa.me/?text={{ urlencode(url()->current()) }}" title="{{ __('Share on WhatsApp') }}" target="_blank"><i class="fa fa-whatsapp"></i></a></li>
                        </ul>
                    </figure>
                </div>
            </div>
            <hr style="margin-top: 2%">

            @if (!empty($product->type_de_taille) || !empty($product->type_de_tissu) || !empty($product->type_dencolure) || !empty($product->type_des_manches) || !empty($product->modele) || !empty($product->type_de_tissu) || !empty($product->longueur_des_manches) || !empty($product->coupe_pantalon) || !empty($product->longueur) || !empty($product->coupe_silouhette) || !empty($product->motif) || !empty($product->couleur) || !empty($product->poche) || !empty($product->type_de_produit) || !empty($product->taille) || !empty($product->grandes_occasions) || !empty($product->personnage) || !empty($product->matiere) || !empty($product->duree_de_livraison))
            <div style="margin-top: 4%; margin-bottom: 3%">
                <h4>{{trans('Product Features')}}</h4>
                <div class="row" style="margin-top: 2%">
                    <div class="col-6">
                        <table class="table">
                            @if (!empty($product->type_de_taille))
                            <tr>
                                <th>{{trans('Size Type')}}</th>
                                <td><b>{{$product->type_de_taille}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->type_de_tissu))
                            <tr>
                                <th>{{trans('Fabric Type')}}</th>
                                <td><b>{{$product->type_de_tissu}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->coupe_pantalon))
                            <tr>
                                <th>{{trans('Trouser cut')}}</th>
                                <td><b>{{$product->coupe_pantalon}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->longueur))
                            <tr>
                                <th>{{trans('Length')}}</th>
                                <td><b>{{$product->longueur}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->coupe_silouhette))
                            <tr>
                                <th>{{trans('Silhouette Cut')}}</th>
                                <td><b>{{$product->coupe_silouhette}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->motif))
                            <tr>
                                <th>{{trans('Pattern')}}</th>
                                <td><b>{{$product->motif}}</b></td>
                            </tr>
                            @endif
            			    @if (!empty($product->type_dencolure))
                            <tr>
                                <th>{{trans('Type encolure')}}</th>
                                <td><b>{{$product->type_dencolure}}</b></td>
                            </tr>
                            @endif
	            		    @if (!empty($product->type_des_manches))
                            <tr>
                                <th>{{trans('Type de manche')}}</th>
                                <td><b>{{$product->type_des_manches}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->couleur))
                            <tr>
                                <th>{{trans('Color')}}</th>
                                <td><b>{{$product->couleur}}</b></td>
                            </tr>
                            @endif
                        </table>
                    </div>
                    <div class="col-6">
                        <table class="table">
                            @if (!empty($product->poche))
                            <tr>
                                <th>{{trans('Pocket')}}</th>
                                <td><b>{{$product->poche}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->type_de_produit))
                            <tr>
                                <th>{{trans('Type of product')}}</th>
                                <td><b>{{$product->type_de_produit}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->taille))
                            <tr>
                                <th>{{trans('Size')}}</th>
                                <td><b>{{$product->taille}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->grandes_occasions))
                            <tr>
                                <th>{{trans('Great occasions')}}</th>
                                <td><b>{{$product->grandes_occasions}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->personnage))
                            <tr>
                                <th>{{trans('Character')}}</th>
                                <td><b>{{$product->personnage}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->matiere))
                            <tr>
                                <th>{{trans('Matter')}}</th>
                                <td><b>{{$product->matiere}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->modele))
                            <tr>
                                <th>{{trans('Modèle')}}</th>
                                <td><b>{{$product->modele}}</b></td>
                            </tr>
                            @endif
			                @if (!empty($product->type_de_tissu))
                            <tr>
                                <th>{{trans('Type de tissu')}}</th>
                                <td><b>{{$product->type_de_tissu}}</b></td>
                            </tr>
                            @endif
                            @if (!empty($product->duree_de_livraison))
                            <tr>
                                <th>{{trans('Delivery time')}}</th>
                                <td><b>{{$product->duree_de_livraison}}</b></td>
                            </tr>
                            @endif
                        </table>
                    </div>
                </div>
            </div>
            @endif

            <div class="product__content tab-root">
                <ul class="tab-list">
                    <li class="active"><a href="#tab-description">{{ __('Description') }}</a></li>
                    @if (EcommerceHelper::isReviewEnabled())
                        <li><a href="#tab-reviews">{{ __('Reviews') }}({{ $product->reviews_count }})</a></li>
                    @endif
                    @if (is_plugin_active('faq'))
                        @if (count($product->faq_items) > 0)
                            <li>
                                <a href="#tab-faq">{{ __('Questions and Answers') }}</a>
                            </li>
                        @endif
                    @endif
                </ul>
                <div class="tabs">
                    <div class="tab active" id="tab-description">
                        <div class="document ck-content">
                            {!! BaseHelper::clean($product->content) !!}
                        </div>
                    </div>
                    @if (is_plugin_active('faq') && count($product->faq_items) > 0)
                        <div class="tab faqs-list" id="tab-faq">
                            <div class="accordion" id="faq-accordion">
                                @foreach($product->faq_items as $faq)
                                    <div class="card">
                                        <div class="card-header" id="heading-faq-{{ $loop->index }}">
                                            <h2 class="mb-0">
                                                <button class="btn btn-link btn-block text-left @if (!$loop->first) collapsed @endif" type="button" data-toggle="collapse" data-target="#collapse-faq-{{ $loop->index }}" aria-expanded="true" aria-controls="collapse-faq-{{ $loop->index }}">
                                                    {!! BaseHelper::clean($faq[0]['value']) !!}
                                                </button>
                                            </h2>
                                        </div>

                                        <div id="collapse-faq-{{ $loop->index }}" class="collapse @if ($loop->first) show @endif" aria-labelledby="heading-faq-{{ $loop->index }}" data-parent="#faq-accordion">
                                            <div class="card-body">
                                                {!! BaseHelper::clean($faq[1]['value']) !!}
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif
                    @if (EcommerceHelper::isReviewEnabled())
                        <div class="tab product-reviews-container" id="tab-reviews">
                            @include('plugins/ecommerce::themes.includes.reviews')
                        </div>
                    @endif
                </div>
            </div>
        </article>

        <br />
        {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, null, $product) !!}

        @php
            $crossSellProducts = get_cross_sale_products($product);
        @endphp
        @if (count($crossSellProducts) > 0)
            <section class="section--related-posts">
                <div class="section__header">
                    <h3>{{ __('Customers who bought this item also bought') }}:</h3>
                </div>
                <div class="section__content">
                    <div class="row">
                        @foreach ($crossSellProducts as $crossSellProduct)
                            <div class="col-lg-3 col-md-4 col-6">
                                {!! Theme::partial('product-item', ['product' => $crossSellProduct]) !!}
                            </div>
                        @endforeach
                    </div>
                </div>
            </section>
        @endif

        <section class="section--related-posts">
            <div class="section__header">
                <h3>{{ __('Related Products') }}:</h3>
            </div>
            @php
                $relatedProducts = get_related_products($product, 4);
            @endphp
            <div class="row">
                @foreach($relatedProducts as $relatedProduct)
                    <div class="col-lg-3 col-md-4 col-6">
                        {!! Theme::partial('product-item', ['product' => $relatedProduct]) !!}
                    </div>
                @endforeach
            </div>
        </section>
    </div>
</main>
