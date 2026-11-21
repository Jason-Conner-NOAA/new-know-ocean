(() => {
    const form = document.querySelector('[data-editorial-search]');
    if (!form) return;
    const input = form.elements.q;
    const status = document.querySelector('[data-search-status]');
    const list = document.querySelector('[data-search-results]');
    const fold = value => String(value || '').normalize('NFKD').replace(/\p{M}/gu, '').toLowerCase();
    let index;
    let revision = 0;

    function load() {
        if (!index) index = fetch(form.dataset.index).then(response => {
            if (!response.ok) throw new Error('Search index unavailable');
            return response.json();
        }).then(rows => rows.map(row => ({ row, fields: [row.title, row.keywords, row.description, row.text].map(fold) })))
            .catch(error => { index = null; throw error; });
        return index;
    }

    async function search() {
        const current = ++revision;
        const query = input.value.trim().slice(0, 250);
        list.replaceChildren();
        if (!query) { status.textContent = 'Enter a keyword to search.'; return; }
        const words = [...new Set(fold(query).split(/\s+/).filter(Boolean))];
        status.textContent = 'Searching…';
        try {
            const entries = await load();
            if (current !== revision) return;
            const matches = [];
            for (const { row, fields } of entries) {
                let score = 0;
                for (const word of words) {
                    const field = fields.findIndex(value => value.includes(word));
                    if (field < 0) { score = 0; break; }
                    score += [8, 4, 2, 1][field];
                }
                if (score) matches.push({ row, score });
            }
            matches.sort((a, b) => b.score - a.score);
            const fragment = document.createDocumentFragment();
            for (const { row } of matches) {
                const li = document.createElement('li');
                const label = document.createElement('span');
                label.className = 'eyebrow';
                label.textContent = `${row.kind} · `;
                const link = document.createElement('a');
                link.href = row.url;
                link.textContent = row.title;
                li.append(label, link);
                if (row.description) {
                    const p = document.createElement('p');
                    p.textContent = row.description;
                    li.append(p);
                }
                fragment.append(li);
            }
            list.append(fragment);
            status.textContent = matches.length ? `${matches.length} result${matches.length === 1 ? '' : 's'} for “${query}”.` : `No results for “${query}”. Try a broader keyword.`;
        } catch {
            if (current === revision) status.textContent = 'Search could not load. Try again or browse the archive below.';
        }
    }

    function restore() {
        input.value = (new URL(location.href).searchParams.get('q') || '').slice(0, 250);
        search();
    }
    form.addEventListener('submit', event => {
        event.preventDefault();
        const url = new URL(location.href);
        if (input.value.trim()) url.searchParams.set('q', input.value.trim());
        else url.searchParams.delete('q');
        if (url.href !== location.href) history.pushState(null, '', url);
        search();
    });
    window.addEventListener('popstate', restore);
    form.hidden = false;
    restore();
})();