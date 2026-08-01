declare
   TYPE t_categories IS TABLE OF categories.name%type;
   TYPE t_article_titles IS TABLE OF articles.title%type;
   type t_ids is table of raw(16);
   v_category_name    categories.name%type;
   v_article_title    articles.title%type;
   v_section_title     sections.title%type;
   v_category_ids     t_ids := t_ids();
   v_article_ids      t_ids := t_ids();
   v_section_ids      t_ids := t_ids();
   v_category_id       categories.category_id%type;
   v_article_id        articles.article_id%type;
   v_category_names     t_categories := t_categories(
      'Characters',
      'Geography',
      'Species',
      'Nations',
      'Systems',
      'History',
      'Culture',
      'Technology',
      'Organizations',
      'World'
   );
   v_article_titles     t_article_titles := t_article_titles(
      'The Crystal Mountains of Aethrion',
      'Origins of the Emberfolk',
      'The Rise of the Verdant Dominion',
      'Chronicles of the First Astral War',
      'The Order of the Silver Veil',
      'The Whispering Forest of Lorynth',
      'The Celestial Archive',
      'The Shattered Isles',
      'The Ethereal Conduit System',
      'The Dawnforge Empire',
      'The Serpentblood Tribes',
      'The Great Library of Solinar',
      'The Stormbound Coastlands',
      'The Covenant of the Nine Stars',
      'The Crystal Mountains of Aethrion',
      'Origins of the Emberfolk',
      'The Rise of the Verdant Dominion',
      'Chronicles of the First Astral War',
      'The Order of the Silver Veil',
      'The Whispering Forest of Lorynth',
      'The Celestial Archive',
      'The Shattered Isles',
      'The Ethereal Conduit System',
      'The Dawnforge Empire',
      'The Serpentblood Tribes',
      'The Great Library of Solinar',
      'The Stormbound Coastlands',
      'The Covenant of the Nine Stars'
   );
begin
-- Insert sample data into the Categories, Articles, and Sections tables
   for i in 1..v_category_names.count  loop
        -- Generate ID
      v_category_ids.extend;
      v_category_ids(i) := sys_guid();
      v_category_name := v_category_names(i);
      insert into categories (
         category_id,
         name,
         description,
         position
      ) values
         ( v_category_ids(i),
           v_category_name,
           get_sample_category_description(v_category_names(i)), i );
    end loop;
      for i in 1..v_article_titles.count loop
         v_article_ids.extend;
         v_article_ids(i) := sys_guid();
         v_article_title := v_article_titles(i);
         v_category_id := v_category_ids(MOD(i - 1, v_category_ids.COUNT) + 1);
         insert into articles (
            article_id,
            title,
            summary,
            category_id,
            created_at,
            updated_at,
            position
         ) values
            ( v_article_ids(i),
              v_article_title,
              get_sample_article_summary(v_article_title),
              v_category_id,
              systimestamp,
              systimestamp, i );
      end loop;
      for i in 1..(v_article_titles.count * 2)loop
         v_section_title := 'Section title: ' || i;
         v_article_id := v_article_ids(MOD(i - 1, v_article_ids.COUNT) + 1);
         v_article_title := v_article_titles(MOD(i - 1, v_article_ids.COUNT) + 1);
         insert into sections (
            section_id,
            article_id,
            title,
            content,
            position
         ) values
            ( sys_guid(),
              v_article_id,
              v_section_title,
              get_sample_section_content(
                 v_section_title,
                 v_article_title,
                 get_sample_article_summary(v_article_title)),
                 i
               );
      end loop;
   -- Show the values in the tables
   show_values_of_world_building_tables;
end;
/