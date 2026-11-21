(() => {
    const nav = document.querySelector('[data-article-toc]');
    const headings = [...document.querySelectorAll('[data-article-body] h2, [data-article-body] h3')]
        .filter(heading => heading.textContent.trim());
    if (!nav || headings.length < 2) return;
    let serial = 0;
    for (const heading of headings) {
        if (!heading.id) {
            let id;
            do { id = `article-section-${++serial}`; } while (document.getElementById(id));
            heading.id = id;
        }
        const item = document.createElement('li');
        const link = document.createElement('a');
        link.href = `#${encodeURIComponent(heading.id)}`;
        link.textContent = heading.textContent;
        item.append(link);
        nav.querySelector('ol').append(item);
    }
    nav.hidden = false;
})();