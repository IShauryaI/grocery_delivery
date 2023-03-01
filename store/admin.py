from django.contrib import admin
from .models import *

class CityAdmin(admin.ModelAdmin):
    list_display = ('city_name', 'city_state')
    list_display_links = ('city_name',)
    list_filter = ()
    list_per_page = 15
    list_max_show_all = 200
    list_editable = ()
    list_select_related = False
    search_fields = ()
    search_help_text = None
    date_hierarchy = None
    save_as = False
    save_as_continue = True
    save_on_top = False
    preserve_filters = True
    inlines = []

    # Custom templates (designed to be over-ridden in subclasses)
    add_form_template = None
    change_form_template = None
    change_list_template = None
    delete_confirmation_template = None
    delete_selected_confirmation_template = None
    object_history_template = None
    popup_response_template = None


    # Actions
    actions = []
    actions_on_top = True
    actions_on_bottom = False
    actions_selection_counter = True


class StoreAdmin(admin.ModelAdmin):
    def change_store_rejected(self, request, queryset):
        queryset.update(store_status='d')
    #     give field name and its value
    change_store_rejected.short_description = 'Change Status to Declined'

    def change_store_accepted(self, request, queryset):
        queryset.update(store_status='a')
    #     give field name and its value
    change_store_accepted.short_description = 'Change Status to Accepted'

    list_display = ('store_name', 'City', 'storeImage', 'store_rating', 'store_status')
    list_display_links = ('store_name',)
    list_filter = ('City',)
    list_select_related = False
    list_per_page = 20
    list_max_show_all = 200
    list_editable = ('store_status',)
    search_fields = ('store_name',)
    search_help_text = None
    date_hierarchy = None
    save_as = False
    save_as_continue = True
    save_on_top = False
    preserve_filters = True
    inlines = []

    # Custom templates (designed to be over-ridden in subclasses)
    add_form_template = None
    change_form_template = None
    change_list_template = None
    delete_confirmation_template = None
    delete_selected_confirmation_template = None
    object_history_template = None
    popup_response_template = None

    # Actions
    actions = ['change_store_accepted', 'change_store_rejected']
    actions_on_top = True
    actions_on_bottom = False
    actions_selection_counter = True


class CategoryAdmin(admin.ModelAdmin):

    list_display = ('category_name', 'category_description', 'categoryImage')
    list_display_links = ('category_name',)
    # list_filter = ('City',)
    list_select_related = False
    list_per_page = 20
    list_max_show_all = 200
    # list_editable = ('category_description',)
    # search_fields = ('store_name',)
    search_help_text = None
    date_hierarchy = None
    save_as = False
    save_as_continue = True
    save_on_top = False
    preserve_filters = True
    inlines = []

    # Custom templates (designed to be over-ridden in subclasses)
    add_form_template = None
    change_form_template = None
    change_list_template = None
    delete_confirmation_template = None
    delete_selected_confirmation_template = None
    object_history_template = None
    popup_response_template = None

    # Actions
    actions = []
    actions_on_top = True
    actions_on_bottom = False
    actions_selection_counter = True


class ProductAdmin(admin.ModelAdmin):
    def change_product_rejected(self, request, queryset):
        queryset.update(product_status='d')
    #     give field name and its value
    change_product_rejected.short_description = 'Change Status to Declined'

    def change_product_accepted(self, request, queryset):
        queryset.update(product_status='a')
    #     give field name and its value
    change_product_accepted.short_description = 'Change Status to Accepted'

    list_display = ('product_name', 'Store', 'Category', 'productImage', 'product_price', 'product_status')
    list_display_links = ('product_name',)
    list_filter = ('Store', 'Category')
    list_select_related = False
    list_per_page = 20
    list_max_show_all = 200
    list_editable = ('product_status',)
    search_fields = ('Store',)
    search_help_text = None
    date_hierarchy = None
    save_as = False
    save_as_continue = True
    save_on_top = False
    preserve_filters = True
    inlines = []

    # Custom templates (designed to be over-ridden in subclasses)
    add_form_template = None
    change_form_template = None
    change_list_template = None
    delete_confirmation_template = None
    delete_selected_confirmation_template = None
    object_history_template = None
    popup_response_template = None

    # Actions
    actions = ['change_product_rejected', 'change_product_accepted']
    actions_on_top = True
    actions_on_bottom = False
    actions_selection_counter = True

admin.site.register(City, CityAdmin)
admin.site.register(Store, StoreAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Product, ProductAdmin)