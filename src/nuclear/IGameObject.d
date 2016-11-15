module nuclear.IGameObject;

import nuclear.Graphics;

public interface IGameObject
{
    void Update(int delta);
    void Draw(Graphics g);
    void init();
    void reset();
}
